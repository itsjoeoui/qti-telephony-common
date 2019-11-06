.class public Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;
.super Lcom/android/internal/telephony/SubscriptionController;
.source "QtiSubscriptionController.java"


# static fields
.field private static final ACTION_SUBSCRIPTION_RECORD_ADDED:Ljava/lang/String; = "org.codeaurora.intent.action.SUBSCRIPTION_INFO_RECORD_ADDED"

.field private static final APM_SIM_NOT_PWDN_PROPERTY:Ljava/lang/String; = "persist.vendor.radio.apm_sim_not_pwdn"

.field private static final CARRIER_MODE_CT_CLASS_A:Ljava/lang/String; = "ct_class_a"

.field private static final DUMMY_SUB_ID_BASE:I = 0x7ffffffb

.field static final LOG_TAG:Ljava/lang/String; = "QtiSubscriptionController"

.field private static final NOT_PROVISIONED:I = 0x0

.field private static final PROVISIONED:I = 0x1

.field private static final SETTING_USER_PREF_DATA_SUB:Ljava/lang/String; = "user_preferred_data_sub"

.field private static sCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private static sNumPhones:I


# instance fields
.field private mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

.field private mCallState:[I

.field private mCarrierMode:Ljava/lang/String;

.field private mCurrentDdsSubId:I

.field private mDdsSwitchPostponed:Z

.field private mIsCTClassA:Z

.field private mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

.field private mTelecomManager:Landroid/telecom/TelecomManager;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 69
    const/4 v0, 0x0

    sput-object v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "c"    # Landroid/content/Context;

    .line 127
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SubscriptionController;-><init>(Landroid/content/Context;)V

    .line 84
    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

    .line 96
    const-string v0, "persist.vendor.radio.carrier_mode"

    const-string v1, "default"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCarrierMode:Ljava/lang/String;

    .line 98
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCarrierMode:Ljava/lang/String;

    const-string v1, "ct_class_a"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mIsCTClassA:Z

    .line 100
    const v0, 0x7ffffffb

    iput v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    .line 101
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    .line 102
    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCallState:[I

    .line 103
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDdsSwitchPostponed:Z

    .line 128
    const-string v2, " init by Context"

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 130
    sput v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDefaultPhoneId:I

    .line 131
    sput v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDefaultFallbackSubId:I

    .line 132
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/telecom/TelecomManager;->from(Landroid/content/Context;)Landroid/telecom/TelecomManager;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelecomManager:Landroid/telecom/TelecomManager;

    .line 133
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 134
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v0

    sput v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    .line 135
    sget v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCallState:[I

    .line 136
    sget v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    new-array v0, v0, [Landroid/telephony/PhoneStateListener;

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    .line 137
    return-void
.end method

.method static synthetic access$000(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)[I
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    .line 66
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCallState:[I

    return-object v0
.end method

.method static synthetic access$100(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)Z
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    .line 66
    iget-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDdsSwitchPostponed:Z

    return v0
.end method

.method static synthetic access$200(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)Z
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    .line 66
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isCallStateIdle()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    .line 66
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->retryFailedDdsSwitch()V

    return-void
.end method

.method private clearVoiceSubId()V
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    .line 141
    invoke-virtual {v0}, Landroid/content/Context;->getOpPackageName()Ljava/lang/String;

    move-result-object v0

    .line 140
    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubscriptionInfoList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 142
    .local v0, "records":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[clearVoiceSubId] records: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 143
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultVoiceSubId()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->shouldDefaultBeCleared(Ljava/util/List;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    const-string v1, "[clearVoiceSubId] clear voice sub id"

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 145
    const v1, 0x7ffffffb

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultVoiceSubId(I)V

    .line 147
    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;
    .locals 2

    .line 119
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sInstance:Lcom/android/internal/telephony/SubscriptionController;

    if-nez v0, :cond_0

    .line 120
    const-string v0, "QtiSubscriptionController"

    const-string v1, "getInstance null"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    :cond_0
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sInstance:Lcom/android/internal/telephony/SubscriptionController;

    check-cast v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    return-object v0
.end method

.method private getPhoneIdFromDummySubId(I)I
    .locals 1
    .param p1, "subId"    # I

    .line 195
    const v0, 0x7ffffffb

    sub-int v0, p1, v0

    return v0
.end method

.method private getPhoneStateListener(II)Landroid/telephony/PhoneStateListener;
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "subId"    # I

    .line 633
    move v0, p1

    .line 636
    .local v0, "pid":I
    new-instance v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v1, p0, v2, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;Ljava/lang/Integer;I)V

    return-object v1
.end method

.method private getUiccProvisionStatus(I)I
    .locals 2
    .param p1, "slotId"    # I

    .line 528
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v0

    .line 529
    .local v0, "uiccCardProvisioner":Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;
    if-eqz v0, :cond_0

    .line 530
    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getCurrentUiccCardProvisioningStatus(I)I

    move-result v1

    return v1

    .line 532
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private getUserPrefDataSubIdFromDB()I
    .locals 3

    .line 614
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "user_preferred_data_sub"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private handleDataPreference(I)V
    .locals 7
    .param p1, "nextActiveSubId"    # I

    .line 487
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getUserPrefDataSubIdFromDB()I

    move-result v0

    .line 488
    .local v0, "userPrefDataSubId":I
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultDataSubId()I

    move-result v1

    .line 490
    .local v1, "currentDataSubId":I
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    .line 491
    invoke-virtual {v2}, Landroid/content/Context;->getOpPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubscriptionInfoList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 492
    .local v2, "subInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    if-nez v2, :cond_0

    .line 493
    return-void

    .line 495
    :cond_0
    const/4 v3, 0x0

    .line 496
    .local v3, "userPrefSubValid":Z
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/SubscriptionInfo;

    .line 497
    .local v5, "subInfo":Landroid/telephony/SubscriptionInfo;
    invoke-virtual {v5}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v6

    if-ne v6, v0, :cond_1

    .line 498
    const/4 v3, 0x1

    .line 500
    .end local v5    # "subInfo":Landroid/telephony/SubscriptionInfo;
    :cond_1
    goto :goto_0

    .line 501
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "havePrefSub = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, " user pref subId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " current dds "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " next active subId "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 507
    iget-boolean v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mIsCTClassA:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_3

    invoke-virtual {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getSubId(I)[I

    move-result-object v4

    aget v4, v4, v5

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 508
    const-string v4, "set dds to slot0 for ct classA mode"

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 509
    invoke-virtual {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getSubId(I)[I

    move-result-object v4

    aget v4, v4, v5

    invoke-virtual {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultDataSubId(I)V

    goto :goto_1

    .line 510
    :cond_3
    if-eqz v3, :cond_4

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v4

    if-eqz v4, :cond_4

    if-eq v1, v0, :cond_4

    .line 512
    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultDataSubId(I)V

    goto :goto_1

    .line 513
    :cond_4
    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v4

    if-nez v4, :cond_5

    .line 514
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultDataSubId(I)V

    .line 517
    :cond_5
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    const/4 v6, 0x1

    if-le v4, v6, :cond_6

    if-nez v3, :cond_6

    .line 518
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultDataSubId()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->saveUserPrefDataSubIdIntoDB(I)V

    .line 523
    :cond_6
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;

    move-result-object v4

    .line 524
    .local v4, "radioCapController":Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;
    invoke-virtual {v4, v5}, Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;->setDdsIfRequired(Z)V

    .line 525
    return-void
.end method

.method public static init(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;
    .locals 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .line 106
    const-class v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    monitor-enter v0

    .line 107
    :try_start_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sInstance:Lcom/android/internal/telephony/SubscriptionController;

    if-nez v1, :cond_0

    .line 108
    new-instance v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    invoke-direct {v1, p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sInstance:Lcom/android/internal/telephony/SubscriptionController;

    .line 109
    sput-object p1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    .line 110
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v1

    sput v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    goto :goto_0

    .line 112
    :cond_0
    const-string v1, "QtiSubscriptionController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "init() called multiple times!  sInstance = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sInstance:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :goto_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sInstance:Lcom/android/internal/telephony/SubscriptionController;

    check-cast v1, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    monitor-exit v0

    return-object v1

    .line 115
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isCallStateIdle()Z
    .locals 3

    .line 652
    const/4 v0, 0x1

    .line 653
    .local v0, "callStateIdle":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    if-ge v1, v2, :cond_1

    .line 654
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCallState:[I

    aget v2, v2, v1

    if-eqz v2, :cond_0

    .line 655
    const/4 v0, 0x0

    .line 653
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 658
    .end local v1    # "i":I
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isCallStateIdle "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 659
    return v0
.end method

.method private isNonSimAccountFound()Z
    .locals 5

    .line 582
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelecomManager:Landroid/telecom/TelecomManager;

    .line 583
    invoke-virtual {v0}, Landroid/telecom/TelecomManager;->getCallCapablePhoneAccounts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 585
    .local v0, "phoneAccounts":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/telecom/PhoneAccountHandle;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 586
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telecom/PhoneAccountHandle;

    .line 587
    .local v1, "phoneAccountHandle":Landroid/telecom/PhoneAccountHandle;
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelecomManager:Landroid/telecom/TelecomManager;

    invoke-virtual {v2, v1}, Landroid/telecom/TelecomManager;->getPhoneAccount(Landroid/telecom/PhoneAccountHandle;)Landroid/telecom/PhoneAccount;

    move-result-object v2

    .line 588
    .local v2, "phoneAccount":Landroid/telecom/PhoneAccount;
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v3, v2}, Landroid/telephony/TelephonyManager;->getSubIdForPhoneAccount(Landroid/telecom/PhoneAccount;)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 590
    const-string v3, "Other than SIM account found. "

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logi(Ljava/lang/String;)V

    .line 591
    const/4 v3, 0x1

    return v3

    .line 593
    .end local v1    # "phoneAccountHandle":Landroid/telecom/PhoneAccountHandle;
    .end local v2    # "phoneAccount":Landroid/telecom/PhoneAccount;
    :cond_0
    goto :goto_0

    .line 594
    :cond_1
    const-string v1, "Other than SIM account not found "

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logi(Ljava/lang/String;)V

    .line 595
    const/4 v1, 0x0

    return v1
.end method

.method private isRadioAvailableOnAllSubs()Z
    .locals 3

    .line 365
    const/4 v0, 0x0

    move v1, v0

    .local v1, "i":I
    :goto_0
    sget v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    if-ge v1, v2, :cond_1

    .line 366
    sget-object v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v1

    invoke-interface {v2}, Lcom/android/internal/telephony/CommandsInterface;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isAvailable()Z

    move-result v2

    if-nez v2, :cond_0

    return v0

    .line 365
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 368
    .end local v1    # "i":I
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private isShuttingDown()Z
    .locals 3

    .line 372
    const/4 v0, 0x0

    move v1, v0

    .local v1, "i":I
    :goto_0
    sget v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    if-ge v1, v2, :cond_1

    .line 373
    sget-object v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sPhones:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, v1

    if-eqz v2, :cond_0

    sget-object v2, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sPhones:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/android/internal/telephony/Phone;->isShuttingDown()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    return v0

    .line 372
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 375
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method private isSubProvisioned(I)Z
    .locals 4
    .param p1, "subId"    # I

    .line 539
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isUsableSubIdValue(I)Z

    move-result v0

    .line 541
    .local v0, "isSubIdUsable":Z
    if-eqz v0, :cond_3

    .line 542
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getSlotIndex(I)I

    move-result v1

    .line 543
    .local v1, "slotId":I
    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v2

    if-eqz v2, :cond_2

    const v2, 0x7ffffffb

    if-lt p1, v2, :cond_0

    goto :goto_0

    .line 547
    :cond_0
    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getUiccProvisionStatus(I)I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1

    .line 548
    const/4 v0, 0x0

    .line 550
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isSubProvisioned, state = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, " subId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->loge(Ljava/lang/String;)V

    .end local v1    # "slotId":I
    goto :goto_1

    .line 544
    .restart local v1    # "slotId":I
    :cond_2
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " Invalid slotId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " or subId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->loge(Ljava/lang/String;)V

    .line 545
    const/4 v0, 0x0

    .line 553
    .end local v1    # "slotId":I
    :cond_3
    :goto_1
    return v0
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 676
    const-string v0, "QtiSubscriptionController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 684
    const-string v0, "QtiSubscriptionController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    return-void
.end method

.method private logi(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 680
    const-string v0, "QtiSubscriptionController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 681
    return-void
.end method

.method private registerPhoneStateListener(II)V
    .locals 3
    .param p1, "slotId"    # I
    .param p2, "subId"    # I

    .line 627
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    invoke-direct {p0, p1, p2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getPhoneStateListener(II)Landroid/telephony/PhoneStateListener;

    move-result-object v1

    aput-object v1, v0, p1

    .line 628
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    aget-object v1, v1, p1

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 630
    return-void
.end method

.method private retryFailedDdsSwitch()V
    .locals 2

    .line 666
    iget v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isActiveSubId(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    .line 667
    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 668
    :cond_0
    const-string v0, "Current dds sub is inactive"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 669
    sget v0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDefaultFallbackSubId:I

    iput v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    .line 671
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Set DDS to : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 672
    iget v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultDataSubId(I)V

    .line 673
    return-void
.end method

.method private saveUserPrefDataSubIdIntoDB(I)V
    .locals 2
    .param p1, "subId"    # I

    .line 619
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "user_preferred_data_sub"

    invoke-static {v0, v1, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 621
    return-void
.end method

.method private subscriptionIdToPhoneAccountHandle(I)Landroid/telecom/PhoneAccountHandle;
    .locals 4
    .param p1, "subId"    # I

    .line 599
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelecomManager:Landroid/telecom/TelecomManager;

    .line 600
    invoke-virtual {v0}, Landroid/telecom/TelecomManager;->getCallCapablePhoneAccounts()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v0

    .line 602
    .local v0, "phoneAccounts":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/telecom/PhoneAccountHandle;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 603
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telecom/PhoneAccountHandle;

    .line 604
    .local v1, "phoneAccountHandle":Landroid/telecom/PhoneAccountHandle;
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelecomManager:Landroid/telecom/TelecomManager;

    invoke-virtual {v2, v1}, Landroid/telecom/TelecomManager;->getPhoneAccount(Landroid/telecom/PhoneAccountHandle;)Landroid/telecom/PhoneAccount;

    move-result-object v2

    .line 605
    .local v2, "phoneAccount":Landroid/telecom/PhoneAccount;
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v3, v2}, Landroid/telephony/TelephonyManager;->getSubIdForPhoneAccount(Landroid/telecom/PhoneAccount;)I

    move-result v3

    if-ne p1, v3, :cond_0

    .line 606
    return-object v1

    .line 608
    .end local v1    # "phoneAccountHandle":Landroid/telecom/PhoneAccountHandle;
    .end local v2    # "phoneAccount":Landroid/telecom/PhoneAccount;
    :cond_0
    goto :goto_0

    .line 610
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method public addSubInfoRecord(Ljava/lang/String;I)I
    .locals 7
    .param p1, "iccId"    # Ljava/lang/String;
    .param p2, "slotId"    # I

    .line 238
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/SubscriptionController;->addSubInfoRecord(Ljava/lang/String;I)I

    move-result v0

    .line 240
    .local v0, "retVal":I
    invoke-virtual {p0, p2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getSubId(I)[I

    move-result-object v1

    .line 241
    .local v1, "subId":[I
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    .line 243
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "addSubInfoRecord: broadcast intent subId["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    aget v4, v1, v3

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 244
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

    new-instance v4, Landroid/os/AsyncResult;

    .line 245
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v4, v6, v5, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 244
    invoke-virtual {v2, v4}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    .line 246
    new-instance v2, Landroid/content/Intent;

    const-string v4, "org.codeaurora.intent.action.SUBSCRIPTION_INFO_RECORD_ADDED"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 247
    .local v2, "intent":Landroid/content/Intent;
    aget v4, v1, v3

    invoke-static {v2, p2, v4}, Landroid/telephony/SubscriptionManager;->putPhoneIdAndSubIdExtra(Landroid/content/Intent;II)V

    .line 248
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 251
    aget v3, v1, v3

    invoke-direct {p0, p2, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->registerPhoneStateListener(II)V

    .line 253
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_0
    return v0
.end method

.method public clearDefaultsForInactiveSubIds()V
    .locals 5

    .line 310
    const-string v0, "clearDefaultsForInactiveSubIds"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->enforceModifyPhoneState(Ljava/lang/String;)V

    .line 313
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 315
    .local v0, "identity":J
    :try_start_0
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    .line 316
    invoke-virtual {v2}, Landroid/content/Context;->getOpPackageName()Ljava/lang/String;

    move-result-object v2

    .line 315
    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubscriptionInfoList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 317
    .local v2, "records":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[clearDefaultsForInactiveSubIds] records: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 318
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultDataSubId()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->shouldDefaultBeCleared(Ljava/util/List;I)Z

    move-result v3

    const/4 v4, -0x1

    if-eqz v3, :cond_0

    .line 319
    const-string v3, "[clearDefaultsForInactiveSubIds] clearing default data sub id"

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 320
    invoke-virtual {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultDataSubId(I)V

    .line 322
    :cond_0
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultSmsSubId()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->shouldDefaultBeCleared(Ljava/util/List;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 323
    const-string v3, "[clearDefaultsForInactiveSubIds] clearing default sms sub id"

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 324
    invoke-virtual {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultSmsSubId(I)V

    .line 326
    :cond_1
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultVoiceSubId()I

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->shouldDefaultBeCleared(Ljava/util/List;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 327
    const-string v3, "[clearDefaultsForInactiveSubIds] clearing default voice sub id"

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 328
    const v3, 0x7ffffffb

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultVoiceSubId(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 331
    .end local v2    # "records":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    :cond_2
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 332
    nop

    .line 333
    return-void

    .line 331
    :catchall_0
    move-exception v2

    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v2
.end method

.method public clearSubInfo()I
    .locals 5

    .line 258
    invoke-super {p0}, Lcom/android/internal/telephony/SubscriptionController;->clearSubInfo()I

    move-result v0

    .line 261
    .local v0, "retVal":I
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    sget v3, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->sNumPhones:I

    if-ge v2, v3, :cond_1

    .line 262
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    aget-object v3, v3, v2

    if-eqz v3, :cond_0

    .line 263
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    aget-object v4, v4, v2

    invoke-virtual {v3, v4, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 265
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mPhoneStateListener:[Landroid/telephony/PhoneStateListener;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    .line 261
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 268
    .end local v2    # "i":I
    :cond_1
    return v0
.end method

.method protected getDummySubIds(I)[I
    .locals 4
    .param p1, "slotIdx"    # I

    .line 201
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubInfoCountMax()I

    move-result v0

    .line 202
    .local v0, "numSubs":I
    if-lez v0, :cond_1

    .line 203
    new-array v1, v0, [I

    .line 204
    .local v1, "dummyValues":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 205
    const v3, 0x7ffffffb

    add-int/2addr v3, p1

    aput v3, v1, v2

    .line 204
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 211
    .end local v2    # "i":I
    :cond_0
    return-object v1

    .line 213
    .end local v1    # "dummyValues":[I
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public getPhoneId(I)I
    .locals 2
    .param p1, "subId"    # I

    .line 173
    const v0, 0x7fffffff

    if-ne p1, v0, :cond_0

    .line 174
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultSubId()I

    move-result p1

    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[getPhoneId] asked for default subId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 178
    :cond_0
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 180
    const-string v0, "[getPhoneId]- invalid subId return=-1"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 183
    const/4 v0, -0x1

    return v0

    .line 186
    :cond_1
    const v0, 0x7ffffffb

    if-lt p1, v0, :cond_2

    .line 187
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPhoneId, received dummy subId "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 188
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getPhoneIdFromDummySubId(I)I

    move-result v0

    return v0

    .line 191
    :cond_2
    invoke-super {p0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v0

    return v0
.end method

.method public getSlotIndex(I)I
    .locals 2
    .param p1, "subId"    # I

    .line 153
    const v0, 0x7fffffff

    if-ne p1, v0, :cond_0

    .line 154
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultSubId()I

    move-result p1

    .line 156
    :cond_0
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 157
    const-string v0, "[getSlotIndex]- subId invalid"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 158
    const/4 v0, -0x1

    return v0

    .line 161
    :cond_1
    const v0, 0x7ffffffb

    if-lt p1, v0, :cond_2

    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPhoneId, received dummy subId "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 163
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getPhoneIdFromDummySubId(I)I

    move-result v0

    return v0

    .line 165
    :cond_2
    invoke-super {p0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSlotIndex(I)I

    move-result v0

    return v0
.end method

.method public isRadioInValidState()Z
    .locals 5

    .line 379
    const-string v0, "persist.vendor.radio.apm_sim_not_pwdn"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 380
    .local v0, "isApmSimNotPwrDown":Z
    :goto_0
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "airplane_mode_on"

    invoke-static {v3, v4, v1}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 384
    .local v3, "isAPMOn":I
    if-ne v3, v2, :cond_1

    if-nez v0, :cond_1

    .line 385
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isRadioInValidState, isApmSimNotPwrDown = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ", isAPMOn:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 387
    return v1

    .line 391
    :cond_1
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isRadioAvailableOnAllSubs()Z

    move-result v4

    if-nez v4, :cond_2

    .line 392
    const-string v2, " isRadioInValidState, radio not available"

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 393
    return v1

    .line 397
    :cond_2
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isShuttingDown()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 398
    const-string v2, " isRadioInValidState: device shutdown in progress "

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 399
    return v1

    .line 401
    :cond_3
    return v2
.end method

.method public isSMSPromptEnabled()Z
    .locals 5

    .line 558
    const/4 v0, 0x0

    .line 559
    .local v0, "prompt":Z
    const/4 v1, 0x0

    move v2, v1

    .line 561
    .local v2, "value":I
    :try_start_0
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "multi_sim_sms_prompt"

    invoke-static {v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    .line 565
    goto :goto_0

    .line 563
    :catch_0
    move-exception v3

    .line 564
    .local v3, "snfe":Landroid/provider/Settings$SettingNotFoundException;
    const-string v4, "Settings Exception Reading Dual Sim SMS Prompt Values"

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->loge(Ljava/lang/String;)V

    .line 566
    .end local v3    # "snfe":Landroid/provider/Settings$SettingNotFoundException;
    :goto_0
    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x1

    :goto_1
    move v0, v1

    .line 569
    return v0
.end method

.method public registerForAddSubscriptionRecord(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .line 218
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 219
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

    monitor-enter v1

    .line 220
    :try_start_0
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v2, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 221
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    .line 222
    invoke-virtual {v2}, Landroid/content/Context;->getOpPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubscriptionInfoList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 223
    .local v2, "subInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    if-eqz v2, :cond_0

    .line 224
    invoke-virtual {v0}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 226
    .end local v2    # "subInfoList":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    :cond_0
    monitor-exit v1

    .line 227
    return-void

    .line 226
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public setDefaultDataSubId(I)V
    .locals 4
    .param p1, "subId"    # I

    .line 273
    const-string v0, "setDefaultDataSubId"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->enforceModifyPhoneState(Ljava/lang/String;)V

    .line 274
    const-string v0, "persist.vendor.radio.flexmap_type"

    const-string v1, "nw_mode"

    .line 275
    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 278
    .local v0, "flexMapSupportType":Ljava/lang/String;
    sget-boolean v1, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isLplusLSupported:Z

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isCallStateIdle()Z

    move-result v1

    if-nez v1, :cond_0

    .line 279
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;->isTempDdsSwitchRequired()Z

    move-result v1

    if-nez v1, :cond_0

    .line 281
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Active call, cannot set Dds to : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 282
    iput p1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mCurrentDdsSubId:I

    .line 283
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDdsSwitchPostponed:Z

    .line 284
    return-void

    .line 287
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDdsSwitchPostponed:Z

    .line 290
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "dds"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 292
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;

    move-result-object v1

    .line 294
    .local v1, "radioCapController":Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;
    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;->isBothPhonesMappedToSameStack()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 295
    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;->initNormalMappingRequest()Z

    .line 296
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " setDefaultDataSubId init normal mapping: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 298
    :cond_1
    invoke-super {p0, p1}, Lcom/android/internal/telephony/SubscriptionController;->setDefaultDataSubId(I)V

    .line 299
    .end local v1    # "radioCapController":Lcom/qualcomm/qti/internal/telephony/QtiRadioCapabilityController;
    goto :goto_0

    .line 300
    :cond_2
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->updateAllDataConnectionTrackers()V

    .line 302
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "multi_sim_data_call"

    invoke-static {v1, v2, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 304
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->broadcastDefaultDataSubIdChanged(I)V

    .line 306
    :goto_0
    return-void
.end method

.method public setSMSPromptEnabled(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    .line 574
    const-string v0, "setSMSPromptEnabled"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->enforceModifyPhoneState(Ljava/lang/String;)V

    .line 575
    move v0, p1

    .line 576
    .local v0, "value":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "multi_sim_sms_prompt"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 578
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSMSPromptOption to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logi(Ljava/lang/String;)V

    .line 579
    return-void
.end method

.method protected shouldDefaultBeCleared(Ljava/util/List;I)Z
    .locals 7
    .param p2, "subId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/telephony/SubscriptionInfo;",
            ">;I)Z"
        }
    .end annotation

    .line 337
    .local p1, "records":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[shouldDefaultBeCleared: subId] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 338
    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 339
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[shouldDefaultBeCleared] return true no records subId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 340
    return v0

    .line 342
    :cond_0
    invoke-static {p2}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 344
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[shouldDefaultBeCleared] return false only one subId, subId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 345
    return v2

    .line 347
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/telephony/SubscriptionInfo;

    .line 348
    .local v3, "record":Landroid/telephony/SubscriptionInfo;
    invoke-virtual {v3}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v4

    .line 349
    .local v4, "id":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[shouldDefaultBeCleared] Record.id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 350
    if-ne v4, p2, :cond_2

    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[shouldDefaultBeCleared] return false subId is active, subId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 352
    return v2

    .line 354
    .end local v3    # "record":Landroid/telephony/SubscriptionInfo;
    .end local v4    # "id":I
    :cond_2
    goto :goto_0

    .line 355
    :cond_3
    invoke-virtual {p0, p2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getSlotIndex(I)I

    move-result v1

    .line 356
    .local v1, "slotId":I
    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getUiccProvisionStatus(I)I

    move-result v3

    if-ne v3, v0, :cond_4

    .line 357
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[shouldDefaultBeCleared] return false subId is provisioned, subId="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 358
    return v2

    .line 360
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[shouldDefaultBeCleared] return true not active subId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logdl(Ljava/lang/String;)V

    .line 361
    return v0
.end method

.method public unregisterForAddSubscriptionRecord(Landroid/os/Handler;)V
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;

    .line 230
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

    monitor-enter v0

    .line 231
    :try_start_0
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mAddSubscriptionRecordRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 232
    monitor-exit v0

    .line 233
    return-void

    .line 232
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method declared-synchronized updateUserPreferences()V
    .locals 8

    monitor-enter p0

    .line 410
    const/4 v0, 0x0

    .line 411
    .local v0, "mNextActivatedSub":Landroid/telephony/SubscriptionInfo;
    const/4 v1, 0x0

    .line 412
    .local v1, "activeCount":I
    :try_start_0
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isRadioInValidState()Z

    move-result v2

    if-nez v2, :cond_0

    .line 413
    const-string v2, "Radio is in Invalid state, Ignore Updating User Preference!!!"

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 414
    monitor-exit p0

    return-void

    .line 416
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getOpPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubscriptionInfoList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 419
    .local v2, "sil":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    if-eqz v2, :cond_c

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v3, v4, :cond_1

    goto/16 :goto_2

    .line 430
    :cond_1
    const-string v3, "persist.vendor.radio.aosp_usr_pref_sel"

    const/4 v5, 0x0

    invoke-static {v3, v5}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 431
    const-string v3, "updateUserPreferences: AOSP user preference option enabled "

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logi(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 432
    monitor-exit p0

    return-void

    .line 436
    :cond_2
    :try_start_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/telephony/SubscriptionInfo;

    .line 437
    .local v6, "subInfo":Landroid/telephony/SubscriptionInfo;
    invoke-virtual {v6}, Landroid/telephony/SubscriptionInfo;->getSimSlotIndex()I

    move-result v7

    invoke-direct {p0, v7}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getUiccProvisionStatus(I)I

    move-result v7

    if-ne v7, v4, :cond_3

    .line 438
    add-int/lit8 v1, v1, 0x1

    .line 439
    if-nez v0, :cond_3

    move-object v0, v6

    .line 441
    .end local v6    # "subInfo":Landroid/telephony/SubscriptionInfo;
    :cond_3
    goto :goto_0

    .line 442
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateUserPreferences:: active sub count = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " dds = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 443
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultDataSubId()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " voice = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultVoiceSubId()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " sms = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultSmsSubId()I

    move-result v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 442
    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V

    .line 448
    if-ne v1, v4, :cond_5

    .line 449
    invoke-virtual {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setSMSPromptEnabled(Z)V

    .line 455
    :cond_5
    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getActiveSubInfoCountMax()I

    move-result v3

    if-ne v3, v4, :cond_6

    goto/16 :goto_1

    .line 457
    :cond_6
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->handleDataPreference(I)V

    .line 459
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultSmsSubId()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v3

    if-nez v3, :cond_7

    .line 460
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultSmsSubId(I)V

    .line 462
    :cond_7
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultVoiceSubId()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v3

    if-nez v3, :cond_8

    .line 463
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultVoiceSubId(I)V

    .line 471
    :cond_8
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isNonSimAccountFound()Z

    move-result v3

    if-nez v3, :cond_9

    if-ne v1, v4, :cond_9

    .line 472
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    .line 473
    .local v3, "subId":I
    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->subscriptionIdToPhoneAccountHandle(I)Landroid/telecom/PhoneAccountHandle;

    move-result-object v4

    .line 474
    .local v4, "phoneAccountHandle":Landroid/telecom/PhoneAccountHandle;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "set default phoneaccount to  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logi(Ljava/lang/String;)V

    .line 475
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mTelecomManager:Landroid/telecom/TelecomManager;

    invoke-virtual {v5, v4}, Landroid/telecom/TelecomManager;->setUserSelectedOutgoingPhoneAccount(Landroid/telecom/PhoneAccountHandle;)V

    .line 477
    .end local v3    # "subId":I
    .end local v4    # "phoneAccountHandle":Landroid/telecom/PhoneAccountHandle;
    :cond_9
    sget v3, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->mDefaultFallbackSubId:I

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isSubProvisioned(I)Z

    move-result v3

    if-nez v3, :cond_a

    .line 478
    invoke-virtual {v0}, Landroid/telephony/SubscriptionInfo;->getSubscriptionId()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultFallbackSubId(I)V

    .line 481
    :cond_a
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->notifySubscriptionInfoChanged()V

    .line 482
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateUserPreferences: after currentDds = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultDataSubId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " voice = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultVoiceSubId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " sms = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getDefaultSmsSubId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 482
    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logd(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 484
    monitor-exit p0

    return-void

    .line 455
    :cond_b
    :goto_1
    monitor-exit p0

    return-void

    .line 420
    :cond_c
    :goto_2
    :try_start_3
    const-string v3, "updateUserPreferences: Subscription list is empty"

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->logi(Ljava/lang/String;)V

    .line 423
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->clearVoiceSubId()V

    .line 424
    const v3, 0x7ffffffb

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->setDefaultFallbackSubId(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 425
    monitor-exit p0

    return-void

    .line 409
    .end local v0    # "mNextActivatedSub":Landroid/telephony/SubscriptionInfo;
    .end local v1    # "activeCount":I
    .end local v2    # "sil":Ljava/util/List;, "Ljava/util/List<Landroid/telephony/SubscriptionInfo;>;"
    :catchall_0
    move-exception v0

    monitor-exit p0

    .end local p0    # "this":Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;
    throw v0
.end method
