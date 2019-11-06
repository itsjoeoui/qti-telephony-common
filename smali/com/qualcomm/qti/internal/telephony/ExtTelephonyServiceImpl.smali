.class public Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;
.super Lorg/codeaurora/internal/IExtTelephony$Stub;
.source "ExtTelephonyServiceImpl.java"


# static fields
.field private static final CONFIG_CURRENT_PRIMARY_SUB:Ljava/lang/String; = "config_current_primary_sub"

.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "ExtTelephonyServiceImpl"

.field private static final TELEPHONY_SERVICE_NAME:Ljava/lang/String; = "extphone"

.field private static mContext:Landroid/content/Context;

.field private static sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;


# instance fields
.field private mDsda:Lorg/codeaurora/internal/IDsda;

.field private mQtiSmscHelper:Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    const/4 v0, 0x0

    sput-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 66
    invoke-direct {p0}, Lorg/codeaurora/internal/IExtTelephony$Stub;-><init>()V

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mDsda:Lorg/codeaurora/internal/IDsda;

    .line 67
    const-string v0, "init constructor "

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 69
    const-string v0, "extphone"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    if-nez v0, :cond_0

    .line 70
    const-string v0, "extphone"

    invoke-static {v0, p0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 72
    :cond_0
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;

    invoke-direct {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mQtiSmscHelper:Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;

    .line 73
    return-void
.end method

.method public static getInstance()Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;
    .locals 2

    .line 60
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    if-nez v0, :cond_0

    .line 61
    const-string v0, "ExtTelephonyServiceImpl"

    const-string v1, "getInstance null"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    :cond_0
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    return-object v0
.end method

.method public static init(Landroid/content/Context;)Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 48
    const-class v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    monitor-enter v0

    .line 49
    :try_start_0
    sput-object p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    .line 50
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    if-nez v1, :cond_0

    .line 51
    new-instance v1, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    invoke-direct {v1}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;-><init>()V

    sput-object v1, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    goto :goto_0

    .line 53
    :cond_0
    const-string v1, "ExtTelephonyServiceImpl"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init() called multiple times!  sInstance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    :goto_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->sInstance:Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;

    monitor-exit v0

    return-object v1

    .line 56
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isPrimaryCarrierMccMnc(Ljava/lang/String;)Z
    .locals 26
    .param p1, "mccMnc"    # Ljava/lang/String;

    move-object/from16 v0, p0

    .line 304
    move-object/from16 v1, p1

    const-string v2, "405840"

    const-string v3, "405854"

    const-string v4, "405855"

    const-string v5, "405856"

    const-string v6, "405857"

    const-string v7, "405858"

    const-string v8, "405859"

    const-string v9, "405860"

    const-string v10, "405861"

    const-string v11, "405862"

    const-string v12, "405863"

    const-string v13, "405864"

    const-string v14, "405865"

    const-string v15, "405866"

    const-string v16, "405867"

    const-string v17, "405868"

    const-string v18, "405869"

    const-string v19, "405870"

    const-string v20, "405871"

    const-string v21, "405872"

    const-string v22, "405873"

    const-string v23, "405874"

    const-string v24, "22201"

    const-string v25, "2221"

    filled-new-array/range {v2 .. v25}, [Ljava/lang/String;

    move-result-object v2

    .line 309
    .local v2, "mccMncList":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v2, v5

    .line 310
    .local v6, "mccmnc":Ljava/lang/String;
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 311
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Found a matching combination  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 312
    const/4 v3, 0x1

    return v3

    .line 309
    .end local v6    # "mccmnc":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 315
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Not found a matching combination  "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 316
    return v4
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 368
    const-string v0, "ExtTelephonyServiceImpl"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 372
    const-string v0, "ExtTelephonyServiceImpl"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    return-void
.end method


# virtual methods
.method public activateUiccCard(I)I
    .locals 1
    .param p1, "slotId"    # I

    .line 89
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->activateUiccCard(I)I

    move-result v0

    return v0
.end method

.method public deactivateUiccCard(I)I
    .locals 1
    .param p1, "slotId"    # I

    .line 94
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->deactivateUiccCard(I)I

    move-result v0

    return v0
.end method

.method public getActiveSubscription()I
    .locals 3

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getActiveSubscription mDsda:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mDsda:Lorg/codeaurora/internal/IDsda;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 141
    :try_start_0
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mDsda:Lorg/codeaurora/internal/IDsda;

    invoke-interface {v0}, Lorg/codeaurora/internal/IDsda;->getActiveSubscription()I

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, "ex":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getActiveSubscription:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 145
    .end local v0    # "ex":Landroid/os/RemoteException;
    const/4 v0, -0x1

    return v0
.end method

.method public getCurrentPrimaryCardSlotId()I
    .locals 1

    .line 218
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getCurrentPrimarySlotFromDB(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public getCurrentUiccCardProvisioningStatus(I)I
    .locals 1
    .param p1, "slotId"    # I

    .line 77
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v0

    .line 78
    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getCurrentUiccCardProvisioningStatus(I)I

    move-result v0

    .line 77
    return v0
.end method

.method public getPhoneIdForECall()I
    .locals 1

    .line 115
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->getPhoneIdForECall()I

    move-result v0

    return v0
.end method

.method public getPrimaryCarrierSlotId()I
    .locals 10

    .line 267
    const/4 v0, -0x1

    .line 268
    .local v0, "slotId":I
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    .line 269
    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoList()Ljava/util/List;

    move-result-object v1

    .line 270
    .local v1, "subInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    const/4 v2, 0x0

    .line 272
    .local v2, "matchingCount":I
    if-eqz v1, :cond_4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v3, v4, :cond_0

    goto/16 :goto_1

    .line 277
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/SubscriptionInfo;

    .line 278
    .local v5, "subInfo":Landroid/telephony/SubscriptionInfo;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getMcc()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getMnc()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 279
    .local v6, "mccMnc":Ljava/lang/String;
    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->getCurrentUiccCardProvisioningStatus(I)I

    move-result v7

    .line 280
    .local v7, "provisionStatus":I
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "provisionStatus : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " slotId "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 282
    if-ne v7, v4, :cond_1

    .line 283
    invoke-direct {p0, v6}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->isPrimaryCarrierMccMnc(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 284
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Found a matching combination, slotId  "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v0

    .line 286
    add-int/lit8 v2, v2, 0x1

    .line 288
    .end local v5    # "subInfo":Landroid/telephony/SubscriptionInfo;
    .end local v6    # "mccMnc":Ljava/lang/String;
    .end local v7    # "provisionStatus":I
    :cond_1
    goto :goto_0

    .line 291
    :cond_2
    if-le v2, v4, :cond_3

    .line 292
    const-string v3, "Found multiple matches, returning primary slotid"

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 293
    sget-object v3, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "config_current_primary_sub"

    invoke-static {v3, v4, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 297
    :cond_3
    return v0

    .line 273
    :cond_4
    :goto_1
    const-string v3, "No active subscriptions found!!"

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->loge(Ljava/lang/String;)V

    .line 274
    return v0
.end method

.method public getPrimaryStackPhoneId()I
    .locals 1

    .line 120
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->getPrimaryStackPhoneId()I

    move-result v0

    return v0
.end method

.method public getSmscAddress(I)Ljava/lang/String;
    .locals 1
    .param p1, "slotId"    # I

    .line 350
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mQtiSmscHelper:Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;->getSmscAddress(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUiccApplicationCount(I)I
    .locals 2
    .param p1, "slotId"    # I

    .line 157
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v0

    .line 158
    .local v0, "card":Lcom/android/internal/telephony/uicc/UiccCard;
    const/4 v1, 0x0

    .line 159
    .local v1, "count":I
    if-eqz v0, :cond_0

    .line 160
    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCard;->getNumApplications()I

    move-result v1

    .line 162
    :cond_0
    return v1
.end method

.method public getUiccApplicationState(II)I
    .locals 3
    .param p1, "slotId"    # I
    .param p2, "appIndex"    # I

    .line 203
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v0

    .line 204
    .local v0, "card":Lcom/android/internal/telephony/uicc/UiccCard;
    const/4 v1, 0x0

    .line 205
    .local v1, "appState":I
    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {v0, p2}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplicationIndex(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getState()Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->ordinal()I

    move-result v1

    .line 208
    :cond_0
    return v1
.end method

.method public getUiccApplicationType(II)I
    .locals 3
    .param p1, "slotId"    # I
    .param p2, "appIndex"    # I

    .line 184
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v0

    .line 185
    .local v0, "card":Lcom/android/internal/telephony/uicc/UiccCard;
    const/4 v1, 0x0

    .line 186
    .local v1, "appType":I
    if-eqz v0, :cond_0

    .line 187
    invoke-virtual {v0, p2}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplicationIndex(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getType()Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;->ordinal()I

    move-result v1

    .line 189
    :cond_0
    return v1
.end method

.method public getUiccCardProvisioningUserPreference(I)I
    .locals 1
    .param p1, "slotId"    # I

    .line 83
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v0

    .line 84
    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getUiccCardProvisioningUserPreference(I)I

    move-result v0

    .line 83
    return v0
.end method

.method public isDeviceInSingleStandby()Z
    .locals 1

    .line 242
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->isDeviceInSingleStandby()Z

    move-result v0

    return v0
.end method

.method public isDsdaEnabled()Z
    .locals 2

    .line 253
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getMultiSimConfiguration()Landroid/telephony/TelephonyManager$MultiSimVariants;

    move-result-object v0

    sget-object v1, Landroid/telephony/TelephonyManager$MultiSimVariants;->DSDA:Landroid/telephony/TelephonyManager$MultiSimVariants;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isEmergencyNumber(Ljava/lang/String;)Z
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .line 222
    invoke-static {p1}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isFdnEnabled()Z
    .locals 2

    .line 149
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Phone;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v0

    .line 150
    .local v0, "card":Lcom/android/internal/telephony/IccCard;
    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {v0}, Lcom/android/internal/telephony/IccCard;->getIccFdnEnabled()Z

    move-result v1

    return v1

    .line 153
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public isLocalEmergencyNumber(Ljava/lang/String;)Z
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .line 227
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->isLocalEmergencyNumber(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isPotentialEmergencyNumber(Ljava/lang/String;)Z
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .line 232
    invoke-static {p1}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->isPotentialEmergencyNumber(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isPotentialLocalEmergencyNumber(Ljava/lang/String;)Z
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .line 237
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiEmergencyCallHelper;->isPotentialLocalEmergencyNumber(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isPrimaryCarrierSlotId(I)Z
    .locals 4
    .param p1, "slotId"    # I

    .line 326
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    .line 327
    invoke-static {v0}, Landroid/telephony/SubscriptionManager;->from(Landroid/content/Context;)Landroid/telephony/SubscriptionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/telephony/SubscriptionManager;->getActiveSubscriptionInfoForSimSlotIndex(I)Landroid/telephony/SubscriptionInfo;

    move-result-object v0

    .line 329
    .local v0, "subInfo":Landroid/telephony/SubscriptionInfo;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 330
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No active subscription found on slot "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->loge(Ljava/lang/String;)V

    .line 331
    return v1

    .line 334
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getMcc()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getMnc()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 336
    .local v2, "mccMnc":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->isPrimaryCarrierMccMnc(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 337
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Found a matching combination, slotId  "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 338
    const/4 v1, 0x1

    return v1

    .line 340
    :cond_1
    return v1
.end method

.method public isSMSPromptEnabled()Z
    .locals 2

    .line 99
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v0

    if-nez v0, :cond_0

    .line 100
    const-string v0, "ExtTelephonyServiceImpl"

    const-string v1, "QtiSubscriptionController getInstance is null"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    :cond_0
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSMSPromptEnabled()Z

    move-result v0

    return v0
.end method

.method public isVendorApkAvailable(Ljava/lang/String;)Z
    .locals 5
    .param p1, "packageName"    # Ljava/lang/String;

    .line 356
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 357
    .local v0, "pm":Landroid/content/pm/PackageManager;
    const/4 v1, 0x0

    move v2, v1

    .line 359
    .local v2, "isApkAvailable":Z
    :try_start_0
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 360
    const/4 v2, 0x1

    .line 363
    goto :goto_0

    .line 361
    :catch_0
    move-exception v1

    .line 362
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Vendor apk not available for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 364
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :goto_0
    return v2
.end method

.method public setDsdaAdapter(Lorg/codeaurora/internal/IDsda;)V
    .locals 2
    .param p1, "a"    # Lorg/codeaurora/internal/IDsda;

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setDsdaAdapter:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 126
    iput-object p1, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mDsda:Lorg/codeaurora/internal/IDsda;

    .line 127
    return-void
.end method

.method public setLocalCallHold(IZ)Z
    .locals 4
    .param p1, "subscriptionId"    # I
    .param p2, "enable"    # Z

    .line 246
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->getPhoneId(I)I

    move-result v0

    .line 247
    .local v0, "phoneId":I
    invoke-static {v0}, Lcom/android/internal/telephony/PhoneFactory;->getPhone(I)Lcom/android/internal/telephony/Phone;

    move-result-object v1

    .line 248
    .local v1, "phone":Lcom/android/internal/telephony/Phone;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setLocalCallHold:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " enable:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 249
    move-object v2, v1

    check-cast v2, Lcom/qualcomm/qti/internal/telephony/QtiGsmCdmaPhone;

    invoke-virtual {v2, p2}, Lcom/qualcomm/qti/internal/telephony/QtiGsmCdmaPhone;->setLocalCallHold(Z)Z

    move-result v2

    return v2
.end method

.method public setPrimaryCardOnSlot(I)V
    .locals 1
    .param p1, "slotId"    # I

    .line 213
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->getInstance()Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardOnSlot(I)V

    .line 214
    return-void
.end method

.method public setSMSPromptEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .line 107
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v0

    if-nez v0, :cond_0

    .line 108
    const-string v0, "ExtTelephonyServiceImpl"

    const-string v1, "QtiSubscriptionController getInstance is null"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    :cond_0
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setSMSPromptEnabled(Z)V

    .line 111
    return-void
.end method

.method public setSmscAddress(ILjava/lang/String;)Z
    .locals 1
    .param p1, "slotId"    # I
    .param p2, "smsc"    # Ljava/lang/String;

    .line 345
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mQtiSmscHelper:Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;

    invoke-virtual {v0, p1, p2}, Lcom/qualcomm/qti/internal/telephony/QtiSmscHelper;->setSmscAddress(ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public supplyIccDepersonalization(Ljava/lang/String;Ljava/lang/String;Lorg/codeaurora/internal/IDepersoResCallback;I)V
    .locals 1
    .param p1, "netpin"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "callback"    # Lorg/codeaurora/internal/IDepersoResCallback;
    .param p4, "phoneId"    # I

    .line 168
    const-string v0, "supplyIccDepersonalization"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 169
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiDepersoSupplier;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiDepersoSupplier;

    move-result-object v0

    .line 170
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/qualcomm/qti/internal/telephony/QtiDepersoSupplier;->supplyIccDepersonalization(Ljava/lang/String;Ljava/lang/String;Lorg/codeaurora/internal/IDepersoResCallback;I)V

    .line 171
    return-void
.end method

.method public switchToActiveSub(I)V
    .locals 3
    .param p1, "sub"    # I

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "switchToActiveSub:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mDsda:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mDsda:Lorg/codeaurora/internal/IDsda;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 132
    :try_start_0
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->mDsda:Lorg/codeaurora/internal/IDsda;

    invoke-interface {v0, p1}, Lorg/codeaurora/internal/IDsda;->switchToActiveSub(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    goto :goto_0

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "ex":Landroid/os/RemoteException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "switchToActiveSub:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/ExtTelephonyServiceImpl;->logd(Ljava/lang/String;)V

    .line 136
    .end local v0    # "ex":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method
