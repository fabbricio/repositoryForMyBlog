package com.org.coop.retail.entities;

import static com.mysema.query.types.PathMetadataFactory.*;

import com.mysema.query.types.path.*;

import com.mysema.query.types.PathMetadata;
import javax.annotation.Generated;
import com.mysema.query.types.Path;
import com.mysema.query.types.path.PathInits;


/**
 * QRetailTransaction is a Querydsl query type for RetailTransaction
 */
@Generated("com.mysema.query.codegen.EntitySerializer")
public class QRetailTransaction extends EntityPathBase<RetailTransaction> {

    private static final long serialVersionUID = 1268366095L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QRetailTransaction retailTransaction = new QRetailTransaction("retailTransaction");

    public final QBranchMaster branchMaster;

    public final DateTimePath<java.sql.Timestamp> createDate = createDateTime("createDate", java.sql.Timestamp.class);

    public final StringPath createUser = createString("createUser");

    public final StringPath deleteInd = createString("deleteInd");

    public final StringPath deleteReason = createString("deleteReason");

    public final QGlLedgerHrd glLedgerHrd;

    public final QMaterialTranHrd materialTranHrd;

    public final StringPath passingAuthInd = createString("passingAuthInd");

    public final StringPath passingAuthRemark = createString("passingAuthRemark");

    public final NumberPath<Integer> retailTranId = createNumber("retailTranId", Integer.class);

    public final DateTimePath<java.sql.Timestamp> updateDate = createDateTime("updateDate", java.sql.Timestamp.class);

    public final StringPath updateUser = createString("updateUser");

    public QRetailTransaction(String variable) {
        this(RetailTransaction.class, forVariable(variable), INITS);
    }

    public QRetailTransaction(Path<? extends RetailTransaction> path) {
        this(path.getType(), path.getMetadata(), path.getMetadata().isRoot() ? INITS : PathInits.DEFAULT);
    }

    public QRetailTransaction(PathMetadata<?> metadata) {
        this(metadata, metadata.isRoot() ? INITS : PathInits.DEFAULT);
    }

    public QRetailTransaction(PathMetadata<?> metadata, PathInits inits) {
        this(RetailTransaction.class, metadata, inits);
    }

    public QRetailTransaction(Class<? extends RetailTransaction> type, PathMetadata<?> metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branchMaster = inits.isInitialized("branchMaster") ? new QBranchMaster(forProperty("branchMaster")) : null;
        this.glLedgerHrd = inits.isInitialized("glLedgerHrd") ? new QGlLedgerHrd(forProperty("glLedgerHrd"), inits.get("glLedgerHrd")) : null;
        this.materialTranHrd = inits.isInitialized("materialTranHrd") ? new QMaterialTranHrd(forProperty("materialTranHrd"), inits.get("materialTranHrd")) : null;
    }

}

