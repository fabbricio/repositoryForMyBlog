-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.22-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for coopadmin
DROP DATABASE IF EXISTS `coopadmin`;
CREATE DATABASE IF NOT EXISTS `coopadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `coopadmin`;


-- Dumping structure for table coopadmin.address
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(10) DEFAULT NULL COMMENT 'HOME or OFFICE',
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `address_line3` varchar(255) DEFAULT NULL,
  `pin` varchar(10) NOT NULL,
  `dist_id` int(11) NOT NULL,
  `email_id1` varchar(50) DEFAULT NULL,
  `email_id2` varchar(50) DEFAULT NULL,
  `phone_no1` varchar(15) NOT NULL,
  `phone_no2` varchar(15) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `FK_address_district_master` (`dist_id`),
  CONSTRAINT `FK_address_district_master` FOREIGN KEY (`dist_id`) REFERENCES `district_master` (`dist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.address: ~8 rows (approximately)
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`address_id`, `address_name`, `address_type`, `address_line1`, `address_line2`, `address_line3`, `pin`, `dist_id`, `email_id1`, `email_id2`, `phone_no1`, `phone_no2`, `website`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, NULL, 'HOME', 'Kalipur', NULL, NULL, '712708', 1, 'ashismo@gmail.com', NULL, '9830525559', NULL, NULL, '2015-12-07', NULL, NULL, 'ashish', '2015-12-07 08:10:11', NULL, NULL),
	(26, 'Test Address1', NULL, 'Kalipur333', NULL, NULL, '712708', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 10:44:39', NULL, '2016-01-23 07:56:06'),
	(27, 'Test Address2', NULL, 'Naldighi1', NULL, NULL, '712304', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 10:43:58', NULL, NULL),
	(28, 'Test Address3', NULL, 'Naldighi145', NULL, NULL, '712304', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 22:01:52', NULL, NULL),
	(29, 'Test Address3', NULL, 'Naldighi', NULL, NULL, '712304', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 10:46:14', NULL, NULL),
	(30, 'Test Address3', NULL, 'Naldighi17', NULL, NULL, '712304', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-18', NULL, NULL, 'ashish', '2015-12-22 22:24:31', NULL, '2016-01-01 09:11:57'),
	(31, 'Queen Palace', NULL, 'Kalipur', NULL, NULL, '712708', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2016-01-23 21:56:26', NULL, NULL),
	(32, 'Queen Palace', NULL, 'Kalipur', NULL, NULL, '712708', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2016-01-23 22:02:04', NULL, '2016-01-23 22:33:00'),
	(33, 'Queen Palace', NULL, 'Kalipur', NULL, NULL, '712708', 1, NULL, NULL, '9830525559', NULL, NULL, '2015-12-17', NULL, NULL, 'ashish', '2016-02-14 22:08:06', NULL, NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;


-- Dumping structure for table coopadmin.branch_address
DROP TABLE IF EXISTS `branch_address`;
CREATE TABLE IF NOT EXISTS `branch_address` (
  `company_addr_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_addr_id`),
  KEY `FK_company_address_company_master` (`branch_id`),
  KEY `FK_company_address_address` (`address_id`),
  CONSTRAINT `FK_company_address_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `FK_company_address_company_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.branch_address: ~8 rows (approximately)
/*!40000 ALTER TABLE `branch_address` DISABLE KEYS */;
INSERT INTO `branch_address` (`company_addr_id`, `branch_id`, `address_id`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, '2015-12-07', NULL, NULL, 'ashish', '2015-12-17 09:43:24', NULL, '2016-01-05 23:15:29'),
	(16, 25, 26, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 09:43:24', NULL, NULL),
	(17, 25, 27, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 09:43:24', NULL, NULL),
	(28, 25, 28, '2015-12-17', '2015-12-17', NULL, 'ashish', '2015-12-17 10:44:39', NULL, '2015-12-17 22:02:01'),
	(29, 25, 29, '2015-12-17', NULL, NULL, 'ashish', '2015-12-17 10:46:14', NULL, NULL),
	(30, 25, 30, '2015-12-18', NULL, NULL, 'ashish', '2015-12-17 22:03:20', NULL, '2016-01-01 09:11:58'),
	(31, 26, 31, '2015-12-17', NULL, NULL, 'ashish', '2016-01-23 21:56:26', NULL, NULL),
	(32, 27, 32, '2015-12-17', NULL, NULL, 'ashish', '2016-01-23 22:02:04', NULL, NULL),
	(33, 28, 33, '2015-12-17', NULL, NULL, 'ashish', '2016-02-14 22:08:07', NULL, NULL);
/*!40000 ALTER TABLE `branch_address` ENABLE KEYS */;


-- Dumping structure for table coopadmin.branch_license_dtl
DROP TABLE IF EXISTS `branch_license_dtl`;
CREATE TABLE IF NOT EXISTS `branch_license_dtl` (
  `branch_license_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `grace_day` int(11) DEFAULT '0',
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_license_id`),
  KEY `FK_branch_license_dtl_branch_master` (`branch_id`),
  CONSTRAINT `FK_branch_license_dtl_branch_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.branch_license_dtl: ~5 rows (approximately)
/*!40000 ALTER TABLE `branch_license_dtl` DISABLE KEYS */;
INSERT INTO `branch_license_dtl` (`branch_license_id`, `branch_id`, `start_date`, `end_date`, `grace_day`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 25, '2016-01-10', '2017-02-10', 11, '', 'ashish', '2016-01-11 23:02:57', NULL, '2016-01-23 22:34:03'),
	(2, 25, '2017-01-10', '2018-01-10', 10, '', 'ashish', '2016-01-11 23:12:27', NULL, '2016-01-23 22:34:05'),
	(3, 25, '2016-01-10', '2017-02-10', 10, NULL, 'ashish', '2016-01-23 22:33:00', NULL, NULL),
	(4, 27, '2016-01-10', '2017-02-10', 10, NULL, 'ashish', '2016-01-23 22:34:40', NULL, NULL),
	(5, 27, '2016-01-10', '2017-02-10', 10, NULL, 'ashish', '2016-01-23 22:38:46', NULL, NULL);
/*!40000 ALTER TABLE `branch_license_dtl` ENABLE KEYS */;


-- Dumping structure for table coopadmin.branch_master
DROP TABLE IF EXISTS `branch_master`;
CREATE TABLE IF NOT EXISTS `branch_master` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `micr_code` varchar(50) DEFAULT NULL,
  `db_name` varchar(50) NOT NULL,
  `context_root` varchar(50) NOT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.branch_master: ~5 rows (approximately)
/*!40000 ALTER TABLE `branch_master` DISABLE KEYS */;
INSERT INTO `branch_master` (`branch_id`, `parent_id`, `bank_name`, `branch_name`, `ifsc_code`, `micr_code`, `db_name`, `context_root`, `email1`, `email2`, `phone1`, `phone2`, `remarks`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 0, 'ABC', 'ABC', '111111', '111111', 'coopadmin2', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '98305255559', NULL, NULL, '2015-12-07', NULL, NULL, 'ashish', '2015-12-07 08:13:00', NULL, '2016-01-06 07:15:25'),
	(2, 0, 'Test Branch', 'Test Branch', '11AA11', '11AA11', 'coopadmin', 'CustomerSvcWS', 'ujan@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 22:33:33', NULL, '2016-01-05 23:03:42'),
	(25, 0, 'Test Bank', 'Branch1', '12345678', '87654321', 'coopadmin', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-18', NULL, NULL, 'ashish', '2015-12-17 09:43:24', NULL, '2016-01-05 23:03:44'),
	(26, 0, 'Kalipur', 'Kalipur', '12345743', '87656321', 'coopadmin', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-18', NULL, NULL, 'ashish', '2016-01-23 21:56:26', NULL, NULL),
	(27, 0, 'Kalipur1', 'Kalipur1', '12345744', '87656324', 'coopadmin', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-18', NULL, NULL, 'ashish', '2016-01-23 22:02:04', NULL, NULL),
	(28, 0, 'Kalipur', 'Kalipur', '12345723', '87656311', 'coop_kalipur', 'CustomerSvcWS', 'ashismo@gmail.com', NULL, '9830625559', NULL, NULL, '2015-12-18', NULL, NULL, 'ashish', '2016-02-14 22:03:57', NULL, NULL);
/*!40000 ALTER TABLE `branch_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.branch_rule
DROP TABLE IF EXISTS `branch_rule`;
CREATE TABLE IF NOT EXISTS `branch_rule` (
  `branch_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL DEFAULT '0',
  `rule_id` int(11) NOT NULL DEFAULT '0',
  `rule_value` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`branch_rule_id`),
  KEY `FK_company_rule_company_master` (`branch_id`),
  KEY `FK_company_rule_rule_master` (`rule_id`),
  CONSTRAINT `FK_company_rule_company_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`),
  CONSTRAINT `FK_company_rule_rule_master` FOREIGN KEY (`rule_id`) REFERENCES `rule_master` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.branch_rule: ~6 rows (approximately)
/*!40000 ALTER TABLE `branch_rule` DISABLE KEYS */;
INSERT INTO `branch_rule` (`branch_rule_id`, `branch_id`, `rule_id`, `rule_value`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 5, '3', '2015-12-11', NULL, NULL, 'ashish', '2015-12-11 18:59:49', NULL, NULL),
	(2, 1, 2, '4', '2015-12-10', NULL, NULL, 'ashish', '2015-12-14 13:24:36', NULL, NULL),
	(3, 1, 1, 'OTP_BASED_LOGIN', '2015-12-11', NULL, NULL, 'ashish', '2015-12-15 15:09:39', NULL, NULL),
	(4, 2, 1, 'SECURITY_QUESTION_BASED_LOGIN', '2015-12-13', NULL, NULL, 'ashish', '2015-12-13 23:05:30', NULL, NULL),
	(5, 25, 5, '3', '2015-12-11', NULL, NULL, 'ashish', '2016-01-23 07:56:06', NULL, NULL),
	(6, 27, 5, '4', '2015-12-11', NULL, NULL, 'ashish', '2016-01-23 22:33:00', NULL, NULL);
/*!40000 ALTER TABLE `branch_rule` ENABLE KEYS */;


-- Dumping structure for table coopadmin.country_master
DROP TABLE IF EXISTS `country_master`;
CREATE TABLE IF NOT EXISTS `country_master` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(10) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.country_master: ~2 rows (approximately)
/*!40000 ALTER TABLE `country_master` DISABLE KEYS */;
INSERT INTO `country_master` (`country_id`, `country_code`, `country_name`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'IND', 'INDIA', NULL, 'ashish', '2016-01-12 21:49:35', NULL, '2016-01-24 19:06:34'),
	(2, 'USA', 'USA', NULL, 'ashish', '2016-01-24 08:44:06', 'ashish', '2016-01-30 20:16:24');
/*!40000 ALTER TABLE `country_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.district_master
DROP TABLE IF EXISTS `district_master`;
CREATE TABLE IF NOT EXISTS `district_master` (
  `dist_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `district_code` varchar(6) DEFAULT NULL,
  `district_name` varchar(100) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dist_id`),
  UNIQUE KEY `state_id_district_code` (`state_id`,`district_code`),
  KEY `FK_district_master_state_master` (`state_id`),
  CONSTRAINT `FK_district_master_state_master` FOREIGN KEY (`state_id`) REFERENCES `state_master` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.district_master: ~5 rows (approximately)
/*!40000 ALTER TABLE `district_master` DISABLE KEYS */;
INSERT INTO `district_master` (`dist_id`, `state_id`, `district_code`, `district_name`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'HLY', 'Hooghly', NULL, 'ashish', '2016-01-12 21:51:02', NULL, '2016-01-26 20:17:53'),
	(2, 1, 'HOW', 'Howrah', NULL, 'ashish', '2016-01-14 06:58:09', NULL, NULL),
	(3, 2, 'BLR', 'Bangalore', NULL, 'ashish', '2016-01-14 06:58:32', NULL, NULL),
	(5, 1, 'BWN', 'Burdwan', NULL, 'ashish', '2016-01-15 08:22:02', NULL, NULL),
	(6, 4, 'HLY', 'Hooghly', 'Y', 'ashish', '2016-01-24 08:54:41', NULL, '2016-01-30 22:20:26');
/*!40000 ALTER TABLE `district_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.module_master
DROP TABLE IF EXISTS `module_master`;
CREATE TABLE IF NOT EXISTS `module_master` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.module_master: ~4 rows (approximately)
/*!40000 ALTER TABLE `module_master` DISABLE KEYS */;
INSERT INTO `module_master` (`module_id`, `module_name`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'ADMIN', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:22:46', 'ashish', '2015-12-22 22:03:43'),
	(2, 'GENERAL', '2015-12-09', NULL, NULL, 'ashish', '2015-12-09 07:19:32', NULL, '2015-12-22 22:04:06'),
	(3, 'SB', '2015-12-09', NULL, NULL, 'ashish', '2015-12-09 07:19:32', NULL, '2015-12-22 22:04:10'),
	(5, 'RD', '2015-12-08', NULL, NULL, 'ashish', '2016-01-24 08:20:33', NULL, NULL);
/*!40000 ALTER TABLE `module_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.permission_master
DROP TABLE IF EXISTS `permission_master`;
CREATE TABLE IF NOT EXISTS `permission_master` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `permission` varchar(50) NOT NULL COMMENT 'READ,WRITE,DELETE',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `module_id_permission` (`module_id`,`permission`),
  KEY `FK_permission_master_module_master` (`module_id`),
  CONSTRAINT `FK_permission_master_module_master` FOREIGN KEY (`module_id`) REFERENCES `module_master` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.permission_master: ~13 rows (approximately)
/*!40000 ALTER TABLE `permission_master` DISABLE KEYS */;
INSERT INTO `permission_master` (`permission_id`, `module_id`, `permission`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'CREATE', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:55:41', NULL, '2015-12-22 22:04:24'),
	(2, 1, 'READ', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:55:41', NULL, '2015-12-22 22:04:28'),
	(3, 1, 'UPDATE', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:55:41', NULL, '2016-01-17 22:21:35'),
	(4, 1, 'DELETE', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:55:41', NULL, '2015-12-22 22:04:33'),
	(5, 2, 'CREATE', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:55:41', NULL, '2015-12-22 22:04:33'),
	(6, 2, 'READ', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(7, 2, 'UPDATE', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(8, 2, 'DELETE', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(9, 3, 'CREATE', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(10, 3, 'READ', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(11, 3, 'UPDATE', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(12, 3, 'DELETE', '2015-12-22', NULL, NULL, 'ashish', '2015-12-22 22:05:45', NULL, NULL),
	(13, 5, 'CREATE', '2015-12-08', NULL, NULL, 'ashish', '2016-01-24 08:30:24', NULL, NULL);
/*!40000 ALTER TABLE `permission_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.role_master
DROP TABLE IF EXISTS `role_master`;
CREATE TABLE IF NOT EXISTS `role_master` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_user` varchar(20) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  KEY `FK_role_master_company_master` (`branch_id`),
  CONSTRAINT `FK_role_master_company_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.role_master: ~3 rows (approximately)
/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` (`role_id`, `branch_id`, `role_name`, `role_description`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'ADMIN', 'Admin User', '2015-12-08', NULL, NULL, 'ashish', '2015-12-22 22:15:41', NULL, '2015-12-22 22:15:41'),
	(2, 1, 'AUDITOR', 'Auditor', '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:40:45', NULL, NULL),
	(3, 1, 'USER', 'Normal User', '2015-12-08', NULL, NULL, 'ashish', '2015-12-22 22:15:34', NULL, '2015-12-22 22:15:34');
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.role_permission
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `role_perm_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_perm_id`),
  KEY `FK_role_permission_role_master` (`role_id`),
  KEY `FK_role_permission_permission_master` (`permission_id`),
  CONSTRAINT `FK_role_permission_permission_master` FOREIGN KEY (`permission_id`) REFERENCES `permission_master` (`permission_id`),
  CONSTRAINT `FK_role_permission_role_master` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.role_permission: ~6 rows (approximately)
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` (`role_perm_id`, `role_id`, `permission_id`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 3, 5, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:56:13', NULL, '2015-12-22 22:18:58'),
	(2, 1, 1, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:57:55', NULL, '2015-12-22 22:18:37'),
	(3, 1, 2, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:58:53', NULL, '2015-12-22 22:18:41'),
	(4, 1, 3, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:58:59', NULL, '2015-12-22 22:18:46'),
	(5, 1, 4, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:59:06', NULL, '2015-12-22 22:18:49'),
	(6, 2, 9, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 06:59:44', NULL, '2015-12-24 08:11:12');
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;


-- Dumping structure for table coopadmin.rule_master
DROP TABLE IF EXISTS `rule_master`;
CREATE TABLE IF NOT EXISTS `rule_master` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `rule_name` varchar(50) NOT NULL,
  `rule_description` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `module_id_rule_name` (`module_id`,`rule_name`),
  KEY `FK_rule_master_module_master` (`module_id`),
  CONSTRAINT `FK_rule_master_module_master` FOREIGN KEY (`module_id`) REFERENCES `module_master` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.rule_master: ~6 rows (approximately)
/*!40000 ALTER TABLE `rule_master` DISABLE KEYS */;
INSERT INTO `rule_master` (`rule_id`, `module_id`, `rule_name`, `rule_description`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 'LOGIN_OPTION', 'Login option', '2015-12-09', NULL, NULL, 'ashish', '2015-12-09 07:06:59', NULL, '2016-02-27 06:54:39'),
	(2, 2, 'LOCK_AFTER_NO_OF_ATTEMPTS', 'Lock User After how many attempts', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 07:53:47', NULL, '2016-02-27 06:54:41'),
	(3, 2, 'NUMBER_OF_SECURITY_QUESTIONS_TO_ASK', 'Number of Security Questions to be asked', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 07:53:47', NULL, '2016-02-27 06:54:44'),
	(4, 2, 'NUMBER_OF_SECURITY_QUESTIONS_TO_ANSWER', 'Number of Security Questions to be answered', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 18:27:03', NULL, '2016-02-27 06:54:48'),
	(5, 2, 'NUMBER_OF_TIMES_OTP_TO_BE_RESEND', 'Number of Times OTP will be resend', '2015-12-11', NULL, NULL, 'ashish', '2015-12-11 18:58:34', NULL, '2016-02-27 06:54:51'),
	(6, 5, 'LOCK_AFTER_NO_OF_ATTEMPTS', 'Lock User After how many attempts', '2015-12-10', NULL, NULL, 'ashish', '2016-01-24 08:30:24', NULL, NULL);
/*!40000 ALTER TABLE `rule_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.rule_master_values
DROP TABLE IF EXISTS `rule_master_values`;
CREATE TABLE IF NOT EXISTS `rule_master_values` (
  `rule_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `rule_value` varchar(50) DEFAULT NULL,
  `rule_value_description` varchar(50) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rule_value_id`),
  UNIQUE KEY `rule_id_rule_value` (`rule_id`,`rule_value`),
  KEY `FK_rule_master_values_rule_master` (`rule_id`),
  CONSTRAINT `FK_rule_master_values_rule_master` FOREIGN KEY (`rule_id`) REFERENCES `rule_master` (`rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.rule_master_values: ~4 rows (approximately)
/*!40000 ALTER TABLE `rule_master_values` DISABLE KEYS */;
INSERT INTO `rule_master_values` (`rule_value_id`, `rule_id`, `rule_value`, `rule_value_description`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'OTP_BASED_LOGIN', 'OTP Based Loggedin', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 18:17:25', NULL, '2015-12-10 18:20:44'),
	(2, 1, 'SECURITY_QUESTION_BASED_LOGIN', 'Security Question Based Login', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 18:18:52', NULL, '2015-12-10 18:20:51'),
	(3, 1, 'ONE_STEP_LOGIN', 'Username password based login', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 18:20:13', NULL, '2015-12-10 18:21:00'),
	(4, 2, '5', 'Testing data', '2015-12-10', NULL, NULL, 'ashish', '2016-01-24 08:36:45', NULL, '2016-02-27 07:02:14');
/*!40000 ALTER TABLE `rule_master_values` ENABLE KEYS */;


-- Dumping structure for table coopadmin.security_questions
DROP TABLE IF EXISTS `security_questions`;
CREATE TABLE IF NOT EXISTS `security_questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.security_questions: ~9 rows (approximately)
/*!40000 ALTER TABLE `security_questions` DISABLE KEYS */;
INSERT INTO `security_questions` (`question_id`, `question`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 'What is your PAN number', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 16:56:40', NULL, '2016-01-24 19:00:21'),
	(2, 'What is your mother\'s maiden name', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 17:02:51', NULL, '2016-01-24 19:00:21'),
	(3, 'What is your first Job', '2015-12-10', '2015-12-09', NULL, 'ashish', '2015-12-10 17:03:53', 'ashish', '2015-12-10 17:04:44'),
	(4, 'What is the name of your best friend', '2015-12-10', NULL, 'Y', 'ashish', '2015-12-10 17:04:25', 'ashish', '2016-01-24 19:00:54'),
	(5, 'Who is your best teacher1', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 17:06:39', 'ashish', '2016-01-24 19:00:21'),
	(6, 'Who is your best teacher', '2015-12-10', '2015-12-10', NULL, 'ashish', '2016-01-23 06:46:45', NULL, NULL),
	(7, 'What is your passport number', '2015-12-10', NULL, NULL, 'ashish', '2016-01-24 17:58:47', NULL, NULL),
	(8, 'Who is your best teacher1', '2015-12-10', NULL, 'Y', 'ashish', '2016-01-24 18:26:27', 'ashish', '2016-01-24 19:00:54'),
	(9, 'Who is your best teacher1', '2015-12-10', NULL, NULL, 'ashish', '2016-01-24 18:33:07', NULL, NULL);
/*!40000 ALTER TABLE `security_questions` ENABLE KEYS */;


-- Dumping structure for table coopadmin.state_master
DROP TABLE IF EXISTS `state_master`;
CREATE TABLE IF NOT EXISTS `state_master` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `state_code` varchar(5) DEFAULT NULL,
  `state_name` varchar(100) NOT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `country_id_state_code` (`country_id`,`state_code`),
  KEY `FK_state_master_country_master` (`country_id`),
  CONSTRAINT `FK_state_master_country_master` FOREIGN KEY (`country_id`) REFERENCES `country_master` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.state_master: ~6 rows (approximately)
/*!40000 ALTER TABLE `state_master` DISABLE KEYS */;
INSERT INTO `state_master` (`state_id`, `country_id`, `state_code`, `state_name`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'WB', 'West Bengal', NULL, 'ashish', '2016-01-12 21:51:29', NULL, '2016-01-14 06:57:33'),
	(2, 1, 'KA', 'Karnataka', NULL, 'ashish', '2016-01-14 06:57:26', NULL, NULL),
	(3, 1, 'DL', 'Delhi', NULL, 'ashish', '2016-01-15 08:25:52', NULL, NULL),
	(4, 2, 'NJ', 'New Jersey', 'Y', 'ashish', '2016-01-24 08:49:48', 'ashish', '2016-01-30 22:20:26'),
	(5, 2, 'NY', 'New York', NULL, 'ashish', '2016-01-26 20:41:43', NULL, '2016-01-30 20:16:24'),
	(6, 2, 'WD', 'Whashington DC', NULL, 'ashish', '2016-01-26 20:50:14', NULL, '2016-01-30 20:16:24');
/*!40000 ALTER TABLE `state_master` ENABLE KEYS */;


-- Dumping structure for table coopadmin.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email1` varchar(50) DEFAULT NULL,
  `email2` varchar(50) DEFAULT NULL,
  `phone1` varchar(50) NOT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(20) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(20) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `FK_user_company_master` (`branch_id`),
  CONSTRAINT `FK_user_company_master` FOREIGN KEY (`branch_id`) REFERENCES `branch_master` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.user: ~4 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `branch_id`, `user_name`, `first_name`, `middle_name`, `last_name`, `email1`, `email2`, `phone1`, `phone2`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 'ashish', 'Ashish', 'Kumar', 'Mondal', 'ashismo@gmail.com', NULL, '9830525559', NULL, '2015-12-08 06:46:57', NULL, NULL, 'ashish', '2015-12-08 06:47:06', NULL, NULL),
	(2, 2, 'ujan', 'Ujan', NULL, 'Mondal', 'ujan@gmail.com', NULL, '9830625559', NULL, '2015-12-10 22:29:59', NULL, NULL, 'ashish', '2015-12-10 22:30:11', NULL, '2015-12-13 23:01:00'),
	(4, 1, 'ashish1', 'Ashish', NULL, NULL, NULL, NULL, '9830525559', NULL, '2015-12-11 00:00:00', NULL, NULL, 'ashish', '2016-02-19 08:49:15', NULL, '2016-02-19 08:49:15'),
	(5, 27, 'ashish2', 'Ashish', NULL, NULL, NULL, NULL, '9830525559', NULL, '2015-12-11 00:00:00', NULL, NULL, 'ashish', '2016-02-19 08:51:06', NULL, '2016-02-19 08:51:06');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table coopadmin.user_credential
DROP TABLE IF EXISTS `user_credential`;
CREATE TABLE IF NOT EXISTS `user_credential` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(100) NOT NULL,
  `transaction_pwd` varchar(100) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_unsuccessful_login` timestamp NULL DEFAULT NULL,
  `unsuccessful_login_count` int(11) DEFAULT '0',
  `successful_login` int(11) DEFAULT '0',
  `delete_ind` varchar(4) DEFAULT '0',
  `create_user` varchar(20) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(20) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_credential_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.user_credential: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_credential` DISABLE KEYS */;
INSERT INTO `user_credential` (`user_id`, `password`, `transaction_pwd`, `last_login`, `last_unsuccessful_login`, `unsuccessful_login_count`, `successful_login`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, '$2a$10$ZegdnnlLZQK62HAeBPjJee20AKlvVPMB2WiCkFr7L/k8c0QjvpE5e', NULL, '2016-02-27 07:03:24', '2016-01-02 10:34:18', 0, 1, '0', 'ashish', '2015-12-08 07:01:19', 'ashish', '2016-02-27 07:03:24'),
	(2, '$2a$10$ZegdnnlLZQK62HAeBPjJee20AKlvVPMB2WiCkFr7L/k8c0QjvpE5e', NULL, '2016-03-08 10:39:02', '2015-12-28 23:05:00', 0, 1, '0', 'ashish', '2015-12-10 22:31:23', 'ujan', '2016-03-08 10:39:02');
/*!40000 ALTER TABLE `user_credential` ENABLE KEYS */;


-- Dumping structure for table coopadmin.user_credential_otp
DROP TABLE IF EXISTS `user_credential_otp`;
CREATE TABLE IF NOT EXISTS `user_credential_otp` (
  `user_id` int(11) NOT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_resend_counter` int(11) NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_user_credential_otp_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.user_credential_otp: ~1 rows (approximately)
/*!40000 ALTER TABLE `user_credential_otp` DISABLE KEYS */;
INSERT INTO `user_credential_otp` (`user_id`, `otp`, `otp_resend_counter`, `start_date`, `end_date`) VALUES
	(1, '201951', 0, '2016-02-27 07:03:34', '2016-02-27 07:03:49');
/*!40000 ALTER TABLE `user_credential_otp` ENABLE KEYS */;


-- Dumping structure for table coopadmin.user_role
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_user_role_user` (`user_id`),
  KEY `FK_user_role_role_master` (`role_id`),
  CONSTRAINT `FK_user_role_role_master` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`role_id`),
  CONSTRAINT `FK_user_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.user_role: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 1, 1, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 07:02:15', NULL, NULL),
	(2, 1, 2, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 15:15:26', NULL, '2015-12-15 15:13:15'),
	(3, 2, 3, '2015-12-08', NULL, NULL, 'ashish', '2015-12-08 15:15:26', NULL, '2016-03-08 10:38:19');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;


-- Dumping structure for table coopadmin.user_security_question
DROP TABLE IF EXISTS `user_security_question`;
CREATE TABLE IF NOT EXISTS `user_security_question` (
  `user_sec_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `delete_ind` varchar(4) DEFAULT NULL,
  `create_user` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` varchar(50) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_sec_id`),
  KEY `FK_user_sequrity_question_user` (`user_id`),
  KEY `FK_user_sequrity_question_security_questions` (`question_id`),
  CONSTRAINT `FK_user_sequrity_question_security_questions` FOREIGN KEY (`question_id`) REFERENCES `security_questions` (`question_id`),
  CONSTRAINT `FK_user_sequrity_question_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table coopadmin.user_security_question: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_security_question` DISABLE KEYS */;
INSERT INTO `user_security_question` (`user_sec_id`, `user_id`, `question_id`, `answer`, `start_date`, `end_date`, `delete_ind`, `create_user`, `create_date`, `update_user`, `update_date`) VALUES
	(1, 2, 4, 'ashish', '2015-12-10', NULL, NULL, 'ashish', '2015-12-10 22:32:08', NULL, NULL),
	(2, 2, 3, 'wipro', '2015-12-13', NULL, NULL, 'ashish', '2015-12-13 23:15:22', NULL, NULL);
/*!40000 ALTER TABLE `user_security_question` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
