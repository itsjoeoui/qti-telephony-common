.class public Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
.super Ljava/lang/Object;
.source "QtiRilInterface.java"

# interfaces
.implements Lcom/qualcomm/qti/internal/telephony/BaseRilInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;,
        Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$DepersoCallback;
    }
.end annotation


# static fields
.field private static final BYTE_SIZE:I = 0x1

.field private static final INT_SIZE:I = 0x4

.field private static final LOG_TAG:Ljava/lang/String; = "QtiRilInterface"

.field private static final NULL_TERMINATOR:C = '\u0000'

.field private static final NULL_TERMINATOR_LENGTH:I = 0x1

.field private static final SHORT_SIZE:I = 0x2

.field private static mIsServiceReady:Z

.field private static sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;


# instance fields
.field private final ACTION_ADN_INIT_DONE:Ljava/lang/String;

.field private final ACTION_ADN_RECORDS_IND:Ljava/lang/String;

.field private mAdnInitDoneRegistrantList:Landroid/os/RegistrantList;

.field private mAdnRecordsInfoRegistrantList:Landroid/os/RegistrantList;

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

.field private mQcrilHookCb:Lcom/qualcomm/qcrilhook/QcRilHookCallback;

.field private mServiceReadyRegistrantList:Landroid/os/RegistrantList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 60
    const/4 v0, 0x0

    sput-boolean v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mIsServiceReady:Z

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const-string v0, "qualcomm.intent.action.ACTION_ADN_INIT_DONE"

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->ACTION_ADN_INIT_DONE:Ljava/lang/String;

    .line 62
    const-string v0, "qualcomm.intent.action.ACTION_ADN_RECORDS_IND"

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->ACTION_ADN_RECORDS_IND:Ljava/lang/String;

    .line 67
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$1;

    invoke-direct {v0, p0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$1;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;)V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcrilHookCb:Lcom/qualcomm/qcrilhook/QcRilHookCallback;

    .line 558
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$2;

    invoke-direct {v0, p0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$2;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;)V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 97
    const-string v0, " in constructor "

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logd(Ljava/lang/String;)V

    .line 99
    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mServiceReadyRegistrantList:Landroid/os/RegistrantList;

    .line 100
    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnInitDoneRegistrantList:Landroid/os/RegistrantList;

    .line 101
    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnRecordsInfoRegistrantList:Landroid/os/RegistrantList;

    .line 103
    :try_start_0
    new-instance v0, Lcom/qualcomm/qcrilhook/QcRilHook;

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcrilHookCb:Lcom/qualcomm/qcrilhook/QcRilHookCallback;

    invoke-direct {v0, p1, v1}, Lcom/qualcomm/qcrilhook/QcRilHook;-><init>(Landroid/content/Context;Lcom/qualcomm/qcrilhook/QcRilHookCallback;)V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    goto :goto_0

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "se":Ljava/lang/SecurityException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SecurityException during QcRilHook init: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 106
    const/4 v1, 0x0

    sput-boolean v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mIsServiceReady:Z

    .line 109
    .end local v0    # "se":Ljava/lang/SecurityException;
    :goto_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 110
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "qualcomm.intent.action.ACTION_ADN_INIT_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 111
    const-string v1, "qualcomm.intent.action.ACTION_ADN_RECORDS_IND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 112
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 113
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 43
    sget-boolean v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mIsServiceReady:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .line 43
    sput-boolean p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mIsServiceReady:Z

    return p0
.end method

.method static synthetic access$100(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
    .param p1, "x1"    # Ljava/lang/String;

    .line 43
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logd(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;)Landroid/os/RegistrantList;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 43
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mServiceReadyRegistrantList:Landroid/os/RegistrantList;

    return-object v0
.end method

.method static synthetic access$302(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;)Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 43
    sput-object p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    return-object p0
.end method

.method static synthetic access$400(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;[BI)[I
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
    .param p1, "x1"    # [B
    .param p2, "x2"    # I

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->parseInts([BI)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;)Landroid/os/RegistrantList;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 43
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnInitDoneRegistrantList:Landroid/os/RegistrantList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;[B)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
    .param p1, "x1"    # [B

    .line 43
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->responseAdnRecords([B)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;)Landroid/os/RegistrantList;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 43
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnRecordsInfoRegistrantList:Landroid/os/RegistrantList;

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    const-class v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    monitor-enter v0

    .line 87
    :try_start_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    if-nez v1, :cond_0

    .line 88
    new-instance v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-direct {v1, p0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    goto :goto_0

    .line 90
    :cond_0
    const-string v1, "QtiRilInterface"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "instance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :goto_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->sInstance:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 86
    .end local p0    # "context":Landroid/content/Context;
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 576
    const-string v0, "QtiRilInterface"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 577
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 584
    const-string v0, "QtiRilInterface"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    return-void
.end method

.method private logi(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 580
    const-string v0, "QtiRilInterface"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    return-void
.end method

.method private parseInts([BI)[I
    .locals 5
    .param p1, "buffer"    # [B
    .param p2, "numInts"    # I

    .line 267
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 268
    .local v0, "byteBuf":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 270
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "numInts: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 271
    new-array v1, p2, [I

    .line 272
    .local v1, "response":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, p2, :cond_0

    .line 273
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    aput v3, v1, v2

    .line 274
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "response[i]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 272
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 277
    .end local v2    # "i":I
    :cond_0
    return-object v1
.end method

.method private responseAdnRecords([B)Ljava/lang/Object;
    .locals 16
    .param p1, "data"    # [B

    move-object/from16 v1, p0

    .line 478
    invoke-static/range {p1 .. p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 479
    .local v2, "byteBuf":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 481
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v3

    .line 483
    .local v3, "numRecords":I
    new-array v4, v3, [Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;

    .line 486
    .local v4, "AdnRecordsInfoGroup":[Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;
    const/4 v5, 0x0

    move v0, v5

    .local v0, "i":I
    :goto_0
    move v6, v0

    .end local v0    # "i":I
    .local v6, "i":I
    if-ge v6, v3, :cond_4

    .line 487
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;

    invoke-direct {v0}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;-><init>()V

    aput-object v0, v4, v6

    .line 489
    aget-object v0, v4, v6

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v7

    iput v7, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mRecordIndex:I

    .line 491
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v7

    .line 492
    .local v7, "nameLength":I
    if-lez v7, :cond_0

    .line 493
    new-array v8, v7, [B

    .line 494
    .local v8, "alphaTag":[B
    invoke-virtual {v2, v8}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 496
    :try_start_0
    aget-object v0, v4, v6

    new-instance v9, Ljava/lang/String;

    const-string v10, "UTF-8"

    invoke-direct {v9, v8, v10}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iput-object v9, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mAlphaTag:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 500
    goto :goto_1

    .line 497
    :catch_0
    move-exception v0

    .line 498
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v5, "Unsupport UTF-8 to parse name"

    invoke-direct {v1, v5}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 499
    goto/16 :goto_5

    .line 503
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v8    # "alphaTag":[B
    :cond_0
    :goto_1
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v8

    .line 504
    .local v8, "numberLength":I
    if-lez v8, :cond_1

    .line 505
    new-array v9, v8, [B

    .line 506
    .local v9, "number":[B
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 508
    :try_start_1
    aget-object v0, v4, v6

    new-instance v10, Ljava/lang/String;

    const-string v11, "UTF-8"

    invoke-direct {v10, v9, v11}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 509
    invoke-static {v10}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->ConvertToPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mNumber:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 513
    goto :goto_2

    .line 510
    :catch_1
    move-exception v0

    .line 511
    .restart local v0    # "e":Ljava/io/UnsupportedEncodingException;
    const-string v5, "Unsupport UTF-8 to parse number"

    invoke-direct {v1, v5}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 512
    goto/16 :goto_5

    .line 516
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v9    # "number":[B
    :cond_1
    :goto_2
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v9

    .line 517
    .local v9, "numEmails":I
    if-lez v9, :cond_2

    .line 518
    aget-object v0, v4, v6

    iput v9, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mEmailCount:I

    .line 519
    aget-object v0, v4, v6

    new-array v10, v9, [Ljava/lang/String;

    iput-object v10, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mEmails:[Ljava/lang/String;

    .line 520
    move v0, v5

    .local v0, "j":I
    :goto_3
    move v10, v0

    .end local v0    # "j":I
    .local v10, "j":I
    if-ge v10, v9, :cond_2

    .line 521
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v11

    .line 523
    .local v11, "emailLength":I
    new-array v12, v11, [B

    .line 524
    .local v12, "email":[B
    invoke-virtual {v2, v12}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 526
    :try_start_2
    aget-object v0, v4, v6

    iget-object v0, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mEmails:[Ljava/lang/String;

    new-instance v13, Ljava/lang/String;

    const-string v14, "UTF-8"

    invoke-direct {v13, v12, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    aput-object v13, v0, v10
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2

    .line 530
    nop

    .line 520
    .end local v11    # "emailLength":I
    .end local v12    # "email":[B
    add-int/lit8 v0, v10, 0x1

    .end local v10    # "j":I
    .restart local v0    # "j":I
    goto :goto_3

    .line 527
    .end local v0    # "j":I
    .restart local v10    # "j":I
    .restart local v11    # "emailLength":I
    .restart local v12    # "email":[B
    :catch_2
    move-exception v0

    .line 528
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v13, "Unsupport UTF-8 to parse email"

    invoke-direct {v1, v13}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 529
    nop

    .line 534
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v10    # "j":I
    .end local v11    # "emailLength":I
    .end local v12    # "email":[B
    :cond_2
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v10

    .line 535
    .local v10, "numAnrs":I
    if-lez v10, :cond_3

    .line 536
    aget-object v0, v4, v6

    iput v10, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mAdNumCount:I

    .line 537
    aget-object v0, v4, v6

    new-array v11, v10, [Ljava/lang/String;

    iput-object v11, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mAdNumbers:[Ljava/lang/String;

    .line 538
    move v0, v5

    .local v0, "k":I
    :goto_4
    move v11, v0

    .end local v0    # "k":I
    .local v11, "k":I
    if-ge v11, v10, :cond_3

    .line 539
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v12

    .line 541
    .local v12, "anrLength":I
    new-array v13, v12, [B

    .line 542
    .local v13, "anr":[B
    invoke-virtual {v2, v13}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 544
    :try_start_3
    aget-object v0, v4, v6

    iget-object v0, v0, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->mAdNumbers:[Ljava/lang/String;

    new-instance v14, Ljava/lang/String;

    const-string v15, "UTF-8"

    invoke-direct {v14, v13, v15}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 545
    invoke-static {v14}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->ConvertToPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v0, v11
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_3

    .line 549
    nop

    .line 538
    .end local v12    # "anrLength":I
    .end local v13    # "anr":[B
    add-int/lit8 v0, v11, 0x1

    .end local v11    # "k":I
    .restart local v0    # "k":I
    goto :goto_4

    .line 546
    .end local v0    # "k":I
    .restart local v11    # "k":I
    .restart local v12    # "anrLength":I
    .restart local v13    # "anr":[B
    :catch_3
    move-exception v0

    .line 547
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v14, "Unsupport UTF-8 to parse anr"

    invoke-direct {v1, v14}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 548
    nop

    .line 486
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v7    # "nameLength":I
    .end local v8    # "numberLength":I
    .end local v9    # "numEmails":I
    .end local v10    # "numAnrs":I
    .end local v11    # "k":I
    .end local v12    # "anrLength":I
    .end local v13    # "anr":[B
    :cond_3
    add-int/lit8 v0, v6, 0x1

    .end local v6    # "i":I
    .local v0, "i":I
    goto/16 :goto_0

    .line 555
    .end local v0    # "i":I
    :cond_4
    :goto_5
    return-object v4
.end method


# virtual methods
.method public getAdnRecord(Landroid/os/Message;I)V
    .locals 6
    .param p1, "callbackMsg"    # Landroid/os/Message;
    .param p2, "phoneId"    # I

    .line 315
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 316
    .local v0, "requestData":[B
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {v0}, Lcom/qualcomm/qcrilhook/QcRilHook;->createBufferWithNativeByteOrder([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 317
    .local v1, "reqBuffer":Ljava/nio/ByteBuffer;
    const/16 v2, 0xa

    .line 319
    .local v2, "rspLength":I
    invoke-virtual {v1, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 320
    new-instance v3, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;

    const/16 v4, 0xa

    invoke-direct {v3, p0, p1, v4}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;Landroid/os/Message;I)V

    .line 322
    .local v3, "oemHookCb":Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v5, 0x800dd

    invoke-virtual {v4, v5, v0, v3, p2}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsgAsync(I[BLcom/qualcomm/qcrilhook/OemHookCallback;I)V

    .line 328
    const-string v4, "getAdnRecord()"

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 329
    return-void
.end method

.method public getLpluslSupportStatus()Z
    .locals 5

    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "status":Z
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v2, 0x8005e

    invoke-virtual {v1, v2}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsg(I)Landroid/os/AsyncResult;

    move-result-object v1

    .line 225
    .local v1, "ar":Landroid/os/AsyncResult;
    iget-object v2, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v2, :cond_1

    iget-object v2, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v2, :cond_1

    .line 226
    iget-object v2, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, [B

    .line 227
    .local v2, "response":[B
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    const/4 v4, 0x1

    and-int/2addr v3, v4

    if-ne v3, v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    move v0, v4

    .line 230
    .end local v2    # "response":[B
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getLpluslSupportStatus: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 231
    return v0
.end method

.method public getMaxDataAllowed()I
    .locals 4

    .line 209
    const/4 v0, 0x0

    .line 210
    .local v0, "maxData":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v2, 0x8005d

    invoke-virtual {v1, v2}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsg(I)Landroid/os/AsyncResult;

    move-result-object v1

    .line 212
    .local v1, "ar":Landroid/os/AsyncResult;
    iget-object v2, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v2, :cond_0

    iget-object v2, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v2, :cond_0

    .line 213
    iget-object v2, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, [B

    .line 214
    .local v2, "response":[B
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    .line 217
    .end local v2    # "response":[B
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getMaxDataAllowed maxData = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 218
    return v0
.end method

.method public getUiccIccId(I)Ljava/lang/String;
    .locals 6
    .param p1, "phoneId"    # I

    .line 193
    const/4 v0, 0x0

    .line 194
    .local v0, "iccId":Ljava/lang/String;
    const/4 v1, 0x4

    new-array v1, v1, [B

    .line 195
    .local v1, "requestData":[B
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {v1}, Lcom/qualcomm/qcrilhook/QcRilHook;->createBufferWithNativeByteOrder([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 197
    .local v2, "reqBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 198
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v4, 0x8005c

    invoke-virtual {v3, v4, v1, p1}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsg(I[BI)Landroid/os/AsyncResult;

    move-result-object v3

    .line 200
    .local v3, "ar":Landroid/os/AsyncResult;
    iget-object v4, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v4, :cond_0

    iget-object v4, v3, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v4, :cond_0

    .line 201
    new-instance v4, Ljava/lang/String;

    iget-object v5, v3, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, [B

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    move-object v0, v4

    .line 204
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getUiccIccId iccId["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "] = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 205
    return-object v0
.end method

.method public getUiccProvisionPreference(I)Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner$UiccProvisionStatus;
    .locals 6
    .param p1, "phoneId"    # I

    .line 116
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner$UiccProvisionStatus;

    invoke-direct {v0}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner$UiccProvisionStatus;-><init>()V

    .line 117
    .local v0, "provStatus":Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner$UiccProvisionStatus;
    const/4 v1, 0x0

    new-array v1, v1, [B

    .line 119
    .local v1, "requestData":[B
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v3, 0x8005a

    invoke-virtual {v2, v3, v1, p1}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsg(I[BI)Landroid/os/AsyncResult;

    move-result-object v2

    .line 121
    .local v2, "ar":Landroid/os/AsyncResult;
    iget-object v3, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v3, :cond_0

    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v3, :cond_0

    .line 122
    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 123
    .local v3, "byteBuf":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 125
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Data received: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logd(Ljava/lang/String;)V

    .line 127
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner$UiccProvisionStatus;->setUserPreference(I)V

    .line 128
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner$UiccProvisionStatus;->setCurrentState(I)V

    .line 131
    .end local v3    # "byteBuf":Ljava/nio/ByteBuffer;
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get pref, phoneId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " exception "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 132
    return-object v0
.end method

.method public isServiceReady()Z
    .locals 1

    .line 425
    sget-boolean v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mIsServiceReady:Z

    return v0
.end method

.method public qcRilSendDDSInfo(III)V
    .locals 1
    .param p1, "ddsPhoneId"    # I
    .param p2, "reason"    # I
    .param p3, "rilId"    # I

    .line 458
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-virtual {v0, p1, p2, p3}, Lcom/qualcomm/qcrilhook/QcRilHook;->qcRilSendDDSInfo(III)Z

    .line 459
    return-void
.end method

.method public registerForAdnInitDone(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 2
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .line 446
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 448
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnInitDoneRegistrantList:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 449
    return-void
.end method

.method public registerForAdnRecordsInfo(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 2
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .line 452
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 454
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnRecordsInfoRegistrantList:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 455
    return-void
.end method

.method public registerForServiceReadyEvent(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 4
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .line 437
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 439
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mServiceReadyRegistrantList:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 440
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->isServiceReady()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 441
    new-instance v1, Landroid/os/AsyncResult;

    sget-boolean v2, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mIsServiceReady:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    .line 443
    :cond_0
    return-void
.end method

.method public registerForUnsol(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "event"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .line 429
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {p1, p2, p3}, Lcom/qualcomm/qcrilhook/QcRilHook;->register(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 430
    return-void
.end method

.method public sendPhoneStatus(II)V
    .locals 5
    .param p1, "isReady"    # I
    .param p2, "phoneId"    # I

    .line 235
    const/4 v0, 0x0

    .line 236
    .local v0, "iccId":Ljava/lang/String;
    const/4 v1, 0x1

    new-array v1, v1, [B

    .line 237
    .local v1, "requestData":[B
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {v1}, Lcom/qualcomm/qcrilhook/QcRilHook;->createBufferWithNativeByteOrder([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 239
    .local v2, "reqBuffer":Ljava/nio/ByteBuffer;
    int-to-byte v3, p1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 240
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v4, 0x8001a

    invoke-virtual {v3, v4, v1, p2}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsg(I[BI)Landroid/os/AsyncResult;

    move-result-object v3

    .line 242
    .local v3, "ar":Landroid/os/AsyncResult;
    return-void
.end method

.method public setLocalCallHold(IZ)Z
    .locals 1
    .param p1, "phoneId"    # I
    .param p2, "enable"    # Z

    .line 474
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-virtual {v0, p1, p2}, Lcom/qualcomm/qcrilhook/QcRilHook;->setLocalCallHold(IZ)Z

    move-result v0

    return v0
.end method

.method public setUiccProvisionPreference(II)Z
    .locals 6
    .param p1, "userPref"    # I
    .param p2, "phoneId"    # I

    .line 246
    const/4 v0, 0x0

    .line 247
    .local v0, "retval":Z
    const/16 v1, 0x8

    new-array v1, v1, [B

    .line 248
    .local v1, "requestData":[B
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {v1}, Lcom/qualcomm/qcrilhook/QcRilHook;->createBufferWithNativeByteOrder([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 250
    .local v2, "reqBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 251
    invoke-virtual {v2, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 253
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v4, 0x8005b

    invoke-virtual {v3, v4, v1, p2}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsg(I[BI)Landroid/os/AsyncResult;

    move-result-object v3

    .line 255
    .local v3, "ar":Landroid/os/AsyncResult;
    iget-object v4, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v4, :cond_0

    .line 256
    const/4 v0, 0x1

    .line 259
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "set provision userPref "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " phoneId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v3, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 261
    return v0
.end method

.method public supplyIccDepersonalization(Ljava/lang/String;Ljava/lang/String;Lorg/codeaurora/internal/IDepersoResCallback;I)V
    .locals 7
    .param p1, "netpin"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "callback"    # Lorg/codeaurora/internal/IDepersoResCallback;
    .param p4, "phoneId"    # I

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "supplyDepersonalization: netpin = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " type = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "phoneId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logd(Ljava/lang/String;)V

    .line 169
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    .line 170
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x0

    .line 173
    .local v1, "payload":[B
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    .line 174
    if-nez p1, :cond_0

    goto :goto_0

    .line 175
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    :goto_0
    add-int/2addr v2, v3

    .line 177
    .local v2, "payloadLength":I
    new-array v1, v2, [B

    .line 178
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {v1}, Lcom/qualcomm/qcrilhook/QcRilHook;->createBufferWithNativeByteOrder([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 180
    .local v3, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 181
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 183
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 184
    :cond_1
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 186
    new-instance v4, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$DepersoCallback;

    invoke-direct {v4, p0, p3, v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$DepersoCallback;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;Lorg/codeaurora/internal/IDepersoResCallback;Landroid/os/Message;)V

    .line 187
    .local v4, "oemHookCb":Lcom/qualcomm/qcrilhook/OemHookCallback;
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v6, 0x800d8

    invoke-virtual {v5, v6, v1, v4, p4}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsgAsync(I[BLcom/qualcomm/qcrilhook/OemHookCallback;I)V

    .line 190
    return-void
.end method

.method public unRegisterForServiceReadyEvent(Landroid/os/Handler;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;

    .line 462
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mServiceReadyRegistrantList:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 463
    return-void
.end method

.method public unRegisterForUnsol(Landroid/os/Handler;)V
    .locals 1
    .param p1, "handler"    # Landroid/os/Handler;

    .line 433
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {p1}, Lcom/qualcomm/qcrilhook/QcRilHook;->unregister(Landroid/os/Handler;)V

    .line 434
    return-void
.end method

.method public unregisterForAdnInitDone(Landroid/os/Handler;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;

    .line 466
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnInitDoneRegistrantList:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 467
    return-void
.end method

.method public unregisterForAdnRecordsInfo(Landroid/os/Handler;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;

    .line 470
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mAdnRecordsInfoRegistrantList:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 471
    return-void
.end method

.method public updateAdnRecord(Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;Landroid/os/Message;I)V
    .locals 15
    .param p1, "adnRecordInfo"    # Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;
    .param p2, "callbackMsg"    # Landroid/os/Message;
    .param p3, "phoneId"    # I

    move-object v1, p0

    .line 333
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getNumEmails()I

    move-result v2

    .line 334
    .local v2, "numEmails":I
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getNumAdNumbers()I

    move-result v3

    .line 335
    .local v3, "numAdNumbers":I
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getAlphaTag()Ljava/lang/String;

    move-result-object v4

    .line 336
    .local v4, "name":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getNumber()Ljava/lang/String;

    move-result-object v5

    .line 338
    .local v5, "number":Ljava/lang/String;
    nop

    .line 339
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v0, :cond_0

    move v0, v7

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v0, v6

    :goto_0
    const/16 v8, 0xa

    add-int/2addr v8, v0

    .line 340
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 341
    move v0, v7

    goto :goto_1

    :cond_1
    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    add-int/2addr v0, v6

    :goto_1
    add-int/2addr v8, v0

    .line 342
    .local v8, "dataSize":I
    move v0, v7

    .local v0, "i":I
    :goto_2
    if-ge v0, v2, :cond_2

    .line 343
    add-int/lit8 v8, v8, 0x2

    .line 344
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getEmails()[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v0

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v9, v6

    add-int/2addr v8, v9

    .line 342
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 346
    .end local v0    # "i":I
    :cond_2
    move v0, v7

    .local v0, "j":I
    :goto_3
    if-ge v0, v3, :cond_3

    .line 347
    add-int/lit8 v8, v8, 0x2

    .line 348
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getAdNumbers()[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v0

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v9

    array-length v9, v9

    add-int/2addr v9, v6

    add-int/2addr v8, v9

    .line 346
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 351
    .end local v0    # "j":I
    :cond_3
    new-array v9, v8, [B

    .line 352
    .local v9, "requestData":[B
    iget-object v0, v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    invoke-static {v9}, Lcom/qualcomm/qcrilhook/QcRilHook;->createBufferWithNativeByteOrder([B)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 353
    .local v10, "reqBuffer":Ljava/nio/ByteBuffer;
    const/4 v11, 0x1

    .line 355
    .local v11, "rspLength":I
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;

    move-object/from16 v12, p2

    invoke-direct {v0, v1, v12, v6}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;Landroid/os/Message;I)V

    move-object v6, v0

    .line 357
    .local v6, "oemHookCb":Lcom/qualcomm/qti/internal/telephony/QtiRilInterface$AdnOemHookCallback;
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getRecordIndex()I

    move-result v0

    int-to-short v0, v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 358
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 359
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 361
    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {v4, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 362
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 367
    goto :goto_4

    .line 364
    :catch_0
    move-exception v0

    .line 365
    .local v0, "usee":Ljava/io/UnsupportedEncodingException;
    const-string v7, "Unsupport UTF-8 to parse name"

    invoke-direct {v1, v7}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 366
    return-void

    .line 369
    .end local v0    # "usee":Ljava/io/UnsupportedEncodingException;
    :cond_4
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 372
    :goto_4
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 373
    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 375
    nop

    .line 376
    :try_start_1
    invoke-static {v5}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->ConvertToRecordNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v13, "UTF-8"

    invoke-virtual {v0, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 375
    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 377
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 382
    goto :goto_5

    .line 379
    :catch_1
    move-exception v0

    .line 380
    .restart local v0    # "usee":Ljava/io/UnsupportedEncodingException;
    const-string v7, "Unsupport UTF-8 to parse number"

    invoke-direct {v1, v7}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 381
    return-void

    .line 384
    .end local v0    # "usee":Ljava/io/UnsupportedEncodingException;
    :cond_5
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 387
    :goto_5
    int-to-short v0, v2

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 388
    move v0, v7

    .local v0, "i":I
    :goto_6
    move v13, v0

    .end local v0    # "i":I
    .local v13, "i":I
    if-ge v13, v2, :cond_6

    .line 389
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getEmails()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v13

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 391
    :try_start_2
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getEmails()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v13

    const-string v14, "UTF-8"

    invoke-virtual {v0, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 392
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_2

    .line 397
    nop

    .line 388
    add-int/lit8 v0, v13, 0x1

    .end local v13    # "i":I
    .restart local v0    # "i":I
    goto :goto_6

    .line 394
    .end local v0    # "i":I
    .restart local v13    # "i":I
    :catch_2
    move-exception v0

    .line 395
    .local v0, "usee":Ljava/io/UnsupportedEncodingException;
    const-string v7, "Unsupport UTF-8 to parse email"

    invoke-direct {v1, v7}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 396
    return-void

    .line 400
    .end local v0    # "usee":Ljava/io/UnsupportedEncodingException;
    .end local v13    # "i":I
    :cond_6
    int-to-short v0, v3

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 401
    move v0, v7

    .local v0, "j":I
    :goto_7
    move v13, v0

    .end local v0    # "j":I
    .local v13, "j":I
    if-ge v13, v3, :cond_7

    .line 402
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getAdNumbers()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v13

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-short v0, v0

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 404
    nop

    .line 406
    :try_start_3
    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->getAdNumbers()[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v13

    .line 405
    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->ConvertToRecordNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v14, "UTF-8"

    .line 406
    invoke-virtual {v0, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 404
    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 407
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;
    :try_end_3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3 .. :try_end_3} :catch_3

    .line 412
    nop

    .line 401
    add-int/lit8 v0, v13, 0x1

    .end local v13    # "j":I
    .restart local v0    # "j":I
    goto :goto_7

    .line 409
    .end local v0    # "j":I
    .restart local v13    # "j":I
    :catch_3
    move-exception v0

    .line 410
    .local v0, "usee":Ljava/io/UnsupportedEncodingException;
    const-string v7, "Unsupport UTF-8 to parse anr"

    invoke-direct {v1, v7}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->loge(Ljava/lang/String;)V

    .line 411
    return-void

    .line 415
    .end local v0    # "usee":Ljava/io/UnsupportedEncodingException;
    .end local v13    # "j":I
    :cond_7
    iget-object v0, v1, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->mQcRilHook:Lcom/qualcomm/qcrilhook/QcRilHook;

    const v7, 0x800de

    move/from16 v13, p3

    invoke-virtual {v0, v7, v9, v6, v13}, Lcom/qualcomm/qcrilhook/QcRilHook;->sendQcRilHookMsgAsync(I[BLcom/qualcomm/qcrilhook/OemHookCallback;I)V

    .line 421
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "updateAdnRecord() with "

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/qualcomm/qti/internal/telephony/uicccontact/QtiSimPhoneBookAdnRecord;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->logi(Ljava/lang/String;)V

    .line 422
    return-void
.end method
