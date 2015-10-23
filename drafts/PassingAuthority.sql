select * into gl_ledger_dtl_bck from gl_ledger_dtl where 1=2;
alter table gl_ledger_dtl_bck add column operation_flag character varying(2) default NULL;
select * from gl_ledger_dtl_bck;

select * into gl_ledger_hrd_bck from gl_ledger_hrd where 1=2;
alter table gl_ledger_hrd_bck add column operation_flag character varying(2) default NULL;
select * from gl_ledger_hrd_bck;


--Function to get current financial year
CREATE OR REPLACE FUNCTION getFy ()
RETURNS char(10) AS $f$
declare
	f char(10);
	start_date date;
	start_year char(10);
BEGIN
   start_year := (select to_char(now(),'YYYY'));
   start_date := (start_year || '-04-01');
   select case when now() >= start_date then CAST(start_year as integer) || '-' || (CAST(start_year as integer) + 1) 
		else (CAST(start_year as integer) - 1) || '-' || CAST(start_year as integer) end 
   into f;
   RETURN f;
END;
$f$ LANGUAGE plpgsql;
  
  
--Trigger to move record into gl_ledger_hrd_bck table
CREATE OR REPLACE FUNCTION gl_ledger_hrd_passing_auth()
RETURNS trigger as $$
   Declare recordCnt integer;
BEGIN
	SELECT CASE c WHEN NULL THEN 0 ELSE c END into recordCnt
    FROM (
		SELECT count(*) as c
		FROM gl_ledger_hrd_bck
	 WHERE tran_id=NEW.tran_id) as s;
  IF NEW.type in ('sb','jv') and NEW.fy=(select getFy()) and to_char(NEW.action_date,'YYYY-MM-DD')=to_char(now(),'YYYY-MM-DD') -- jv is for bank charges
	AND recordCnt=0
  THEN
    insert into gl_ledger_hrd_bck select NEW.*,'E';
    delete from gl_ledger_hrd where tran_id = NEW.tran_id;
  END IF;
  RETURN NEW;
END;
$$LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS gl_ledger_hrd_passing_auth_trigger ON gl_ledger_hrd;
CREATE TRIGGER gl_ledger_hrd_passing_auth_trigger
AFTER INSERT ON gl_ledger_hrd
FOR EACH ROW
EXECUTE PROCEDURE gl_ledger_hrd_passing_auth();


--Trigger to move record into gl_ledger_dtl_bck table
CREATE OR REPLACE FUNCTION gl_ledger_dtl_passing_auth()
  RETURNS trigger AS $$
  Declare recordCnt integer;
BEGIN
	SELECT CASE c WHEN NULL THEN 0 ELSE c END into recordCnt
    FROM (
		SELECT count(*) as c
		FROM gl_ledger_dtl_bck
	 WHERE tran_id=NEW.tran_id) as s;
	 
  IF (NEW.particulars in ('cash','interest') and 
		NEW.gl_mas_code in ('14101','28101') and NEW.dr_cr in ('Dr','Cr')
	AND recordCnt in (0,1))
	OR
	(NEW.particulars in ('Cleared') and 
		NEW.gl_mas_code in ('14101') and NEW.dr_cr in ('Cr') 
	AND recordCnt=0)
	OR
	(NEW.particulars in ('bank charge') and 
		NEW.gl_mas_code in ('28201','14101','57903') and NEW.dr_cr in ('Cr','Dr')  -- 28201: For cheque clear
	AND recordCnt in (0,1))
  THEN
    insert into gl_ledger_dtl_bck select NEW.*,'E';
    delete from gl_ledger_dtl where tran_id = NEW.tran_id;
  END IF;
  RETURN NEW;
END;
$$LANGUAGE 'plpgsql';

DROP TRIGGER IF EXISTS gl_ledger_dtl_passing_auth_trigger ON gl_ledger_dtl;
CREATE TRIGGER gl_ledger_dtl_passing_auth_trigger
AFTER INSERT ON gl_ledger_dtl
FOR EACH ROW
EXECUTE PROCEDURE gl_ledger_dtl_passing_auth();

-- drop constraint from gl_ledger_hrd table
ALTER TABLE ONLY gl_ledger_hrd
    DROP CONSTRAINT gl_ledger_hrd_pkey;


-- Passing authority function
CREATE OR REPLACE FUNCTION passing_auth_action(tranId text, paAction text, paComment text)
RETURNS VOID as $$
BEGIN
  -- WRITE A CODE TO INSERT COMMENT INTO comment TABLE and ATTACH the commentId with gl_ledger_hrd_bck and gl_ledger_dtl_bck table
  IF paAction = 'Reject' THEN
    update gl_ledger_hrd_bck set operation_flag='ER' where tran_id=tranId;  -- E = Entry, ER = Entry then Reject
    update gl_ledger_dtl_bck set operation_flag='ER' where tran_id=tranId;
  ELSIF paAction = 'Accept' THEN
	insert into gl_ledger_hrd (tran_id,type,action_date, certificate_no, fy,remarks,cheque_no,cheque_dt,operator_code,entry_time)
	select tran_id,type,action_date, certificate_no, fy,remarks,cheque_no,cheque_dt,operator_code,entry_time from gl_ledger_hrd_bck 
	where tran_id=tranId and operation_flag  in ('E','D');

	insert into gl_ledger_dtl (tran_id,gl_mas_code,qty, amount,dr_cr, particulars,account_no)
	select tran_id,gl_mas_code,qty,amount,dr_cr, particulars,account_no from gl_ledger_dtl_bck 
	where tran_id=tranId and operation_flag in ('E','D');
	
	update gl_ledger_hrd_bck set operation_flag='EA' where tran_id = tranId and operation_flag in ('E','D');
	update gl_ledger_dtl_bck set operation_flag='EA' where tran_id = tranId and operation_flag in ('E','D');
  END IF;
END;
$$LANGUAGE 'plpgsql';