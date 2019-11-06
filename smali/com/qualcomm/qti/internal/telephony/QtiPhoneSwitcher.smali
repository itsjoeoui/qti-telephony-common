.class public Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
.super Lcom/android/internal/telephony/PhoneSwitcher;
.source "QtiPhoneSwitcher.java"


# static fields
.field public static isLplusLSupported:Z


# instance fields
.field private final EVENT_ALLOW_DATA_FALSE_RESPONSE:I

.field private final EVENT_ALLOW_DATA_TRUE_RESPONSE:I

.field private final MAX_CONNECT_FAILURE_COUNT:I

.field private final NONUSER_INITIATED_SWITCH:I

.field private final PROPERTY_TEMP_DDSSWITCH:Ljava/lang/String;

.field private final USER_INITIATED_SWITCH:I

.field private mAllowDataFailure:[I

.field private mCm:Lcom/android/internal/telephony/CallManager;

.field private mDefaultDataPhoneId:I

.field private mManualDdsSwitch:Z

.field private mNewActivePhones:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mQtiDdsSwitchController:Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

.field private mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

.field private final mRetryArray:[I

.field private mSendDdsSwitchDoneIntent:Z

.field private mSimStateIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mSimStates:[Ljava/lang/String;

.field private mWaitForDetachResponse:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 91
    const/4 v0, 0x0

    sput-boolean v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isLplusLSupported:Z

    return-void
.end method

.method public constructor <init>(IILandroid/content/Context;Lcom/android/internal/telephony/SubscriptionController;Landroid/os/Looper;Lcom/android/internal/telephony/ITelephonyRegistry;[Lcom/android/internal/telephony/CommandsInterface;[Lcom/android/internal/telephony/Phone;)V
    .locals 11
    .param p1, "maxActivePhones"    # I
    .param p2, "numPhones"    # I
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "subscriptionController"    # Lcom/android/internal/telephony/SubscriptionController;
    .param p5, "looper"    # Landroid/os/Looper;
    .param p6, "tr"    # Lcom/android/internal/telephony/ITelephonyRegistry;
    .param p7, "cis"    # [Lcom/android/internal/telephony/CommandsInterface;
    .param p8, "phones"    # [Lcom/android/internal/telephony/Phone;

    move-object v0, p0

    move v8, p2

    .line 101
    invoke-direct/range {p0 .. p8}, Lcom/android/internal/telephony/PhoneSwitcher;-><init>(IILandroid/content/Context;Lcom/android/internal/telephony/SubscriptionController;Landroid/os/Looper;Lcom/android/internal/telephony/ITelephonyRegistry;[Lcom/android/internal/telephony/CommandsInterface;[Lcom/android/internal/telephony/Phone;)V

    .line 79
    const/4 v1, 0x5

    iput v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->MAX_CONNECT_FAILURE_COUNT:I

    .line 80
    new-array v1, v1, [I

    fill-array-data v1, :array_0

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mRetryArray:[I

    .line 83
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    .line 84
    iput-boolean v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSendDdsSwitchDoneIntent:Z

    .line 85
    const/4 v2, -0x1

    iput v2, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataPhoneId:I

    .line 89
    iput-boolean v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mWaitForDetachResponse:Z

    .line 92
    const/16 v2, 0x70

    iput v2, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->EVENT_ALLOW_DATA_FALSE_RESPONSE:I

    .line 93
    const/16 v2, 0x71

    iput v2, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->EVENT_ALLOW_DATA_TRUE_RESPONSE:I

    .line 94
    iput v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->USER_INITIATED_SWITCH:I

    .line 95
    const/4 v1, 0x1

    iput v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->NONUSER_INITIATED_SWITCH:I

    .line 96
    const-string v1, "persist.vendor.radio.enable_temp_dds"

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->PROPERTY_TEMP_DDSSWITCH:Ljava/lang/String;

    .line 122
    new-instance v1, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher$1;

    invoke-direct {v1, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher$1;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;)V

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStateIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 103
    new-array v1, v8, [I

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mAllowDataFailure:[I

    .line 104
    new-array v1, v8, [Ljava/lang/String;

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStates:[Ljava/lang/String;

    .line 105
    invoke-static {}, Lcom/android/internal/telephony/CallManager;->getInstance()Lcom/android/internal/telephony/CallManager;

    move-result-object v1

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mCm:Lcom/android/internal/telephony/CallManager;

    .line 106
    iget-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mCm:Lcom/android/internal/telephony/CallManager;

    const/4 v2, 0x0

    const/16 v3, 0x6b

    invoke-virtual {v1, v0, v3, v2}, Lcom/android/internal/telephony/CallManager;->registerForDisconnect(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 107
    invoke-static {p3}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getInstance(Landroid/content/Context;)Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    move-result-object v1

    iput-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 108
    iget-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->isServiceReady()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    invoke-direct {v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->queryMaxDataAllowed()V

    .line 110
    iget-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getLpluslSupportStatus()Z

    move-result v1

    sput-boolean v1, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isLplusLSupported:Z

    goto :goto_0

    .line 112
    :cond_0
    iget-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    const/16 v3, 0x6d

    invoke-virtual {v1, v0, v3, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->registerForServiceReadyEvent(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 114
    :goto_0
    iget-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    const/16 v3, 0x6c

    invoke-virtual {v1, v0, v3, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->registerForUnsol(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 115
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    move-object v9, v1

    .line 116
    .local v9, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v9, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 117
    iget-object v1, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mContext:Landroid/content/Context;

    iget-object v2, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStateIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v9}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 118
    new-instance v10, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

    sget-boolean v7, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isLplusLSupported:Z

    move-object v1, v10

    move v2, v8

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p8

    invoke-direct/range {v1 .. v7}, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;-><init>(ILandroid/content/Context;Lcom/android/internal/telephony/SubscriptionController;Landroid/os/Looper;[Lcom/android/internal/telephony/Phone;Z)V

    iput-object v10, v0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiDdsSwitchController:Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

    .line 120
    return-void

    nop

    :array_0
    .array-data 4
        0x5
        0xa
        0x14
        0x28
        0x3c
    .end array-data
.end method

.method static synthetic access$000(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;

    .line 77
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStates:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
    .param p1, "x1"    # I

    .line 77
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isSimReady(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
    .param p1, "x1"    # I

    .line 77
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isPhoneIdValidForRetry(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
    .param p1, "x1"    # Ljava/lang/String;

    .line 77
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;I)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;
    .param p1, "x1"    # I

    .line 77
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->resetConnectFailureCount(I)V

    return-void
.end method

.method private broadcastNetworkSpecifier()V
    .locals 6

    .line 243
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .local v0, "subIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-ge v2, v3, :cond_1

    .line 245
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v3, v2}, Lcom/android/internal/telephony/SubscriptionController;->getSubId(I)[I

    move-result-object v3

    .line 246
    .local v3, "subId":[I
    if-eqz v3, :cond_0

    array-length v4, v3

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    aget v5, v3, v1

    .line 247
    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/SubscriptionController;->isActiveSubId(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 248
    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isUiccProvisioned(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 249
    aget v4, v3, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    .end local v3    # "subId":[I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 253
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 254
    new-instance v1, Landroid/content/Intent;

    const-string v2, "org.codeaurora.intent.action.ACTION_NETWORK_SPECIFIER_SET"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 256
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "SubIdList"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putIntegerArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 257
    const-string v2, "Broadcast network specifier set intent"

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 258
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 260
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_2
    return-void
.end method

.method private enforceDds(I)V
    .locals 4
    .param p1, "phoneId"    # I

    .line 463
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSubId(I)[I

    move-result-object v0

    .line 464
    .local v0, "subId":[I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enforceDds: subId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    aget v3, v0, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 465
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/SubscriptionController;->setDefaultDataSubId(I)V

    .line 466
    return-void
.end method

.method private handleConnectMaxFailure(I)V
    .locals 4
    .param p1, "phoneId"    # I

    .line 453
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->resetConnectFailureCount(I)V

    .line 454
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()I

    move-result v0

    .line 455
    .local v0, "ddsSubId":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v1

    .line 456
    .local v1, "ddsPhoneId":I
    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->isValidPhoneId(I)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eq p1, v1, :cond_0

    .line 457
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ALLOW_DATA retries exhausted on phoneId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 458
    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->enforceDds(I)V

    .line 460
    :cond_0
    return-void
.end method

.method private handleUnsolMaxDataAllowedChange(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 147
    if-eqz p1, :cond_3

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    goto :goto_0

    .line 151
    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 152
    .local v0, "payload":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 153
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 154
    .local v1, "rspId":I
    const v2, 0x8041e

    if-ne v1, v2, :cond_2

    .line 155
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 156
    .local v2, "response_size":I
    if-gez v2, :cond_1

    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Response size is Invalid "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 158
    return-void

    .line 160
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    iput v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mMaxActivePhones:I

    .line 161
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Unsol Max Data Changed to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mMaxActivePhones:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 163
    .end local v2    # "response_size":I
    :cond_2
    return-void

    .line 148
    .end local v0    # "payload":Ljava/nio/ByteBuffer;
    .end local v1    # "rspId":I
    :cond_3
    :goto_0
    const-string v0, "Null data received in handleUnsolMaxDataAllowedChange"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 149
    return-void
.end method

.method private incConnectFailureCount(I)V
    .locals 2
    .param p1, "phoneId"    # I

    .line 444
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mAllowDataFailure:[I

    aget v1, v0, p1

    add-int/lit8 v1, v1, 0x1

    aput v1, v0, p1

    .line 445
    return-void
.end method

.method private informDdsToRil(I)V
    .locals 5
    .param p1, "ddsSubId"    # I

    .line 543
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v0

    .line 545
    .local v0, "ddsPhoneId":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->isServiceReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 546
    const-string v1, "Oem hook service is not ready yet"

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 547
    return-void

    .line 550
    :cond_0
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-ge v2, v3, :cond_2

    .line 551
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InformDdsToRil rild= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", DDS="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 552
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiDdsSwitchController:Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;->isTempDdsSwitchRequired()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 553
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    const/4 v4, 0x1

    invoke-virtual {v3, v0, v4, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->qcRilSendDDSInfo(III)V

    goto :goto_1

    .line 556
    :cond_1
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v3, v0, v1, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->qcRilSendDDSInfo(III)V

    .line 550
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 560
    .end local v2    # "i":I
    :cond_2
    return-void
.end method

.method private isAnyVoiceCallActiveOnDevice()Z
    .locals 3

    .line 469
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mCm:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v0}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 470
    .local v0, "ret":Z
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isAnyVoiceCallActiveOnDevice: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 471
    return v0
.end method

.method private isPhoneIdValidForRetry(I)Z
    .locals 5
    .param p1, "phoneId"    # I

    .line 533
    const/4 v0, -0x1

    .line 534
    .local v0, "phoneIdForRequest":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPrioritizedDcRequests:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    .line 535
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPrioritizedDcRequests:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/dataconnection/DcRequest;

    .line 536
    .local v1, "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    iget-object v3, v1, Lcom/android/internal/telephony/dataconnection/DcRequest;->networkRequest:Landroid/net/NetworkRequest;

    iget v4, v1, Lcom/android/internal/telephony/dataconnection/DcRequest;->apnId:I

    invoke-virtual {p0, v3, v4}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->phoneIdForRequest(Landroid/net/NetworkRequest;I)I

    move-result v0

    .line 539
    .end local v1    # "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    :cond_0
    if-ne v0, p1, :cond_1

    const/4 v2, 0x1

    nop

    :cond_1
    return v2
.end method

.method private isSimReady(I)Z
    .locals 3
    .param p1, "phoneId"    # I

    .line 263
    const/4 v0, 0x0

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    .line 264
    return v0

    .line 267
    :cond_0
    const-string v1, "READY"

    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStates:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "LOADED"

    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStates:[Ljava/lang/String;

    aget-object v2, v2, p1

    .line 268
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "IMSI"

    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSimStates:[Ljava/lang/String;

    aget-object v2, v2, p1

    .line 269
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 273
    :cond_1
    return v0

    .line 270
    :cond_2
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SIM READY for phoneId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 271
    const/4 v0, 0x1

    return v0
.end method

.method private isUiccProvisioned(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .line 395
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v0

    .line 396
    .local v0, "uiccProvisioner":Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;
    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getCurrentUiccCardProvisioningStatus(I)I

    move-result v1

    if-lez v1, :cond_0

    .line 397
    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 398
    .local v1, "status":Z
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isUiccProvisioned = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 400
    return v1
.end method

.method private onAllowDataResponse(ILandroid/os/AsyncResult;)V
    .locals 5
    .param p1, "phoneId"    # I
    .param p2, "ar"    # Landroid/os/AsyncResult;

    .line 475
    iget-object v0, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v0, :cond_3

    .line 476
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->incConnectFailureCount(I)V

    .line 477
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Allow_data failed on phoneId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", failureCount = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->getConnectFailureCount(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 477
    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 480
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isAnyVoiceCallActiveOnDevice()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 483
    const-string v0, "Wait for call end indication"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 484
    return-void

    .line 487
    :cond_0
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isSimReady(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 490
    const-string v0, "Wait for SIM to get READY"

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 491
    return-void

    .line 494
    :cond_1
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->getConnectFailureCount(I)I

    move-result v0

    .line 495
    .local v0, "allowDataFailureCount":I
    const/4 v1, 0x5

    if-le v0, v1, :cond_2

    .line 496
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->handleConnectMaxFailure(I)V

    goto :goto_0

    .line 498
    :cond_2
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mRetryArray:[I

    add-int/lit8 v2, v0, -0x1

    aget v1, v1, v2

    mul-int/lit16 v1, v1, 0x3e8

    .line 499
    .local v1, "retryDelay":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Scheduling retry connect/allow_data after: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 500
    new-instance v2, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher$2;

    invoke-direct {v2, p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher$2;-><init>(Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;I)V

    int-to-long v3, v1

    invoke-virtual {p0, v2, v3, v4}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 512
    .end local v0    # "allowDataFailureCount":I
    .end local v1    # "retryDelay":I
    :goto_0
    goto :goto_1

    .line 513
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Allow_data success on phoneId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 514
    iget-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSendDdsSwitchDoneIntent:Z

    if-eqz v0, :cond_4

    .line 515
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSendDdsSwitchDoneIntent:Z

    .line 516
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.codeaurora.intent.action.ACTION_DDS_SWITCH_DONE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 518
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "subscription"

    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    .line 519
    invoke-virtual {v2}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()I

    move-result v2

    .line 518
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 520
    const/high16 v1, 0x1000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 521
    const-string v1, "Broadcast dds switch done intent"

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 522
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 524
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_4
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->resetConnectFailureCount(I)V

    .line 525
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mActivePhoneRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 526
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiDdsSwitchController:Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;->isTempDdsSwitchRequired()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 527
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiDdsSwitchController:Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;->resetTempDdsSwitchRequired()V

    .line 530
    :cond_5
    :goto_1
    return-void
.end method

.method private queryMaxDataAllowed()V
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getMaxDataAllowed()I

    move-result v0

    iput v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mMaxActivePhones:I

    .line 144
    return-void
.end method

.method private resetConnectFailureCount(I)V
    .locals 2
    .param p1, "phoneId"    # I

    .line 440
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mAllowDataFailure:[I

    const/4 v1, 0x0

    aput v1, v0, p1

    .line 441
    return-void
.end method


# virtual methods
.method protected activate(I)V
    .locals 5
    .param p1, "phoneId"    # I

    .line 422
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneStates:[Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;

    aget-object v0, v0, p1

    .line 423
    .local v0, "state":Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;
    iget-boolean v1, v0, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->active:Z

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    if-nez v1, :cond_0

    .line 424
    invoke-virtual {p0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->getConnectFailureCount(I)I

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 425
    :cond_0
    iput-boolean v2, v0, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->active:Z

    .line 426
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "activate "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 427
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, v0, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->lastRequested:J

    .line 428
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mCommandsInterfaces:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, p1

    const/16 v3, 0x71

    const/4 v4, 0x0

    .line 429
    invoke-virtual {p0, v3, p1, v4}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    .line 428
    invoke-interface {v1, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->setDataAllowed(ZLandroid/os/Message;)V

    .line 430
    return-void
.end method

.method protected deactivate(I)V
    .locals 4
    .param p1, "phoneId"    # I

    .line 405
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneStates:[Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;

    aget-object v0, v0, p1

    .line 406
    .local v0, "state":Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;
    iget-boolean v1, v0, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->active:Z

    if-nez v1, :cond_0

    .line 407
    return-void

    .line 409
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->active:Z

    .line 410
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "deactivate "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 411
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->lastRequested:J

    .line 412
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneSubscriptions:[I

    aget v3, v3, p1

    invoke-virtual {v2, v3}, Lcom/android/internal/telephony/SubscriptionController;->isActiveSubId(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 413
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mCommandsInterfaces:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, p1

    const/16 v3, 0x70

    .line 414
    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    .line 413
    invoke-interface {v2, v1, v3}, Lcom/android/internal/telephony/CommandsInterface;->setDataAllowed(ZLandroid/os/Message;)V

    .line 415
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mWaitForDetachResponse:Z

    .line 417
    :cond_1
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mActivePhoneRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 418
    return-void
.end method

.method public getConnectFailureCount(I)I
    .locals 1
    .param p1, "phoneId"    # I
    .annotation build Lcom/android/internal/annotations/VisibleForTesting;
    .end annotation

    .line 449
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mAllowDataFailure:[I

    aget v0, v0, p1

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .line 167
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v0}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()I

    move-result v0

    .line 168
    .local v0, "ddsSubId":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v1

    .line 170
    .local v1, "ddsPhoneId":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handle event - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 171
    const/4 v2, 0x0

    .line 172
    .local v2, "ar":Landroid/os/AsyncResult;
    iget v3, p1, Landroid/os/Message;->what:I

    const/4 v4, 0x0

    packed-switch v3, :pswitch_data_0

    .line 235
    :pswitch_0
    invoke-super {p0, p1}, Lcom/android/internal/telephony/PhoneSwitcher;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_2

    .line 205
    :pswitch_1
    iget v3, p1, Landroid/os/Message;->arg1:I

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    invoke-direct {p0, v3, v4}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->onAllowDataResponse(ILandroid/os/AsyncResult;)V

    .line 206
    goto/16 :goto_2

    .line 224
    :pswitch_2
    const-string v3, "EVENT_ALLOW_DATA_FALSE_RESPONSE"

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 225
    iput-boolean v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mWaitForDetachResponse:Z

    .line 226
    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->informDdsToRil(I)V

    .line 227
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNewActivePhones:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 228
    .local v5, "phoneId":I
    invoke-virtual {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->activate(I)V

    .line 229
    .end local v5    # "phoneId":I
    goto :goto_0

    .line 230
    :cond_0
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNewActivePhones:Ljava/util/List;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 231
    iput-boolean v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    goto/16 :goto_2

    .line 184
    :pswitch_3
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, Landroid/os/AsyncResult;

    .line 185
    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v3, :cond_2

    .line 186
    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 187
    .local v3, "isServiceReady":Z
    if-eqz v3, :cond_1

    .line 188
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->queryMaxDataAllowed()V

    .line 189
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v4}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getLpluslSupportStatus()Z

    move-result v4

    sput-boolean v4, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isLplusLSupported:Z

    .line 190
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mQtiDdsSwitchController:Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;

    sget-boolean v5, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isLplusLSupported:Z

    invoke-virtual {v4, v5}, Lcom/qualcomm/qti/internal/telephony/QtiDdsSwitchController;->updateLplusLStatus(Z)V

    .line 192
    .end local v3    # "isServiceReady":Z
    :cond_1
    goto :goto_2

    .line 193
    :cond_2
    const-string v3, "Error: empty result, EVENT_OEM_HOOK_SERVICE_READY"

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 195
    goto :goto_2

    .line 197
    :pswitch_4
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, Landroid/os/AsyncResult;

    .line 198
    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v3, :cond_3

    .line 199
    iget-object v3, v2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Landroid/os/Message;

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->handleUnsolMaxDataAllowedChange(Landroid/os/Message;)V

    goto :goto_2

    .line 201
    :cond_3
    const-string v3, "Error: empty result, EVENT_UNSOL_MAX_DATA_ALLOWED_CHANGED"

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 203
    goto :goto_2

    .line 212
    :pswitch_5
    const-string v3, "EVENT_VOICE_CALL_ENDED"

    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 213
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isAnyVoiceCallActiveOnDevice()Z

    move-result v3

    if-nez v3, :cond_6

    .line 214
    nop

    .local v4, "i":I
    :goto_1
    move v3, v4

    .end local v4    # "i":I
    .local v3, "i":I
    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-ge v3, v4, :cond_6

    .line 215
    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->getConnectFailureCount(I)I

    move-result v4

    if-lez v4, :cond_4

    .line 216
    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isPhoneIdValidForRetry(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 217
    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->resendDataAllowed(I)V

    .line 218
    goto :goto_2

    .line 214
    :cond_4
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_1

    .line 208
    .end local v4    # "i":I
    :pswitch_6
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->broadcastNetworkSpecifier()V

    .line 209
    const-string v3, "subChanged"

    invoke-virtual {p0, v4, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->onEvaluate(ZLjava/lang/String;)V

    .line 210
    goto :goto_2

    .line 174
    :pswitch_7
    const-string v3, "persist.vendor.radio.enable_temp_dds"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 177
    .local v3, "isLplTempSwitch":Z
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isAnyVoiceCallActiveOnDevice()Z

    move-result v5

    if-eqz v5, :cond_5

    if-nez v3, :cond_5

    .line 178
    const-string v4, "Voice call active. Waiting for call end"

    invoke-virtual {p0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 179
    return-void

    .line 181
    :cond_5
    const-string v5, "defaultChanged"

    invoke-virtual {p0, v4, v5}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->onEvaluate(ZLjava/lang/String;)V

    .line 182
    nop

    .line 237
    .end local v3    # "isLplTempSwitch":Z
    :cond_6
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected onEvaluate(ZLjava/lang/String;)V
    .locals 12
    .param p1, "requestsChanged"    # Z
    .param p2, "reason"    # Ljava/lang/String;

    .line 279
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 281
    .local v0, "sb":Ljava/lang/StringBuilder;
    move v1, p1

    .line 282
    .local v1, "diffDetected":Z
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v2}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultDataSubId()I

    move-result v2

    .line 283
    .local v2, "dataSubId":I
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v3, v2}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v3

    .line 284
    .local v3, "ddsPhoneId":I
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v4, v2}, Lcom/android/internal/telephony/SubscriptionController;->isActiveSubId(I)Z

    move-result v4

    const/4 v5, -0x1

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataSubscription:I

    if-ne v2, v4, :cond_1

    :cond_0
    if-eq v3, v5, :cond_2

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataPhoneId:I

    if-eq v3, v4, :cond_2

    .line 288
    :cond_1
    const-string v4, " default "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataSubscription:I

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "->"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 289
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    .line 290
    iput-boolean v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSendDdsSwitchDoneIntent:Z

    .line 291
    iput v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataSubscription:I

    .line 292
    iput v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataPhoneId:I

    .line 293
    const/4 v1, 0x1

    .line 296
    :cond_2
    const/4 v4, 0x0

    move v6, v1

    move v1, v4

    .local v1, "i":I
    .local v6, "diffDetected":Z
    :goto_0
    iget v7, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-ge v1, v7, :cond_4

    .line 297
    iget-object v7, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mSubscriptionController:Lcom/android/internal/telephony/SubscriptionController;

    invoke-virtual {v7, v1}, Lcom/android/internal/telephony/SubscriptionController;->getSubIdUsingPhoneId(I)I

    move-result v7

    .line 298
    .local v7, "sub":I
    iget-object v8, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneSubscriptions:[I

    aget v8, v8, v1

    if-eq v7, v8, :cond_3

    .line 299
    const-string v8, " phone["

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, "] "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneSubscriptions:[I

    aget v8, v8, v1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 300
    const-string v8, "->"

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 301
    iget-object v8, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneSubscriptions:[I

    aput v7, v8, v1

    .line 302
    const/4 v6, 0x1

    .line 296
    .end local v7    # "sub":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 306
    .end local v1    # "i":I
    :cond_4
    invoke-virtual {p0}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->isEmergency()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 307
    const-string v1, "onEvalaute aborted due to Emergency"

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 308
    return-void

    .line 311
    :cond_5
    if-eqz v6, :cond_e

    .line 312
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "evaluating due to "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->log(Ljava/lang/String;)V

    .line 314
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 316
    .local v1, "newActivePhones":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v7, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPrioritizedDcRequests:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/telephony/dataconnection/DcRequest;

    .line 317
    .local v8, "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    iget-object v9, v8, Lcom/android/internal/telephony/dataconnection/DcRequest;->networkRequest:Landroid/net/NetworkRequest;

    iget v10, v8, Lcom/android/internal/telephony/dataconnection/DcRequest;->apnId:I

    invoke-virtual {p0, v9, v10}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->phoneIdForRequest(Landroid/net/NetworkRequest;I)I

    move-result v9

    .line 319
    .local v9, "phoneIdForRequest":I
    if-ne v9, v5, :cond_6

    .end local v8    # "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    .end local v9    # "phoneIdForRequest":I
    goto :goto_1

    .line 320
    .restart local v8    # "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    .restart local v9    # "phoneIdForRequest":I
    :cond_6
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v1, v10}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    .end local v8    # "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    .end local v9    # "phoneIdForRequest":I
    goto :goto_1

    .line 321
    .restart local v8    # "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    .restart local v9    # "phoneIdForRequest":I
    :cond_7
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    iget v11, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mMaxActivePhones:I

    if-lt v10, v11, :cond_8

    goto :goto_2

    .line 323
    .end local v8    # "dcRequest":Lcom/android/internal/telephony/dataconnection/DcRequest;
    .end local v9    # "phoneIdForRequest":I
    :cond_8
    goto :goto_1

    .line 334
    :cond_9
    :goto_2
    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNewActivePhones:Ljava/util/List;

    .line 335
    move v5, v4

    .local v5, "phoneId":I
    :goto_3
    iget v7, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-ge v5, v7, :cond_b

    .line 336
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a

    .line 337
    invoke-virtual {p0, v5}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->deactivate(I)V

    .line 335
    :cond_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 340
    .end local v5    # "phoneId":I
    :cond_b
    iget-boolean v5, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mWaitForDetachResponse:Z

    if-nez v5, :cond_e

    .line 341
    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->informDdsToRil(I)V

    .line 343
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNewActivePhones:Ljava/util/List;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    .line 344
    .local v5, "activateDdsPhone":Z
    if-eqz v5, :cond_c

    iget-boolean v7, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    if-eqz v7, :cond_c

    .line 345
    invoke-virtual {p0, v3}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->activate(I)V

    goto :goto_5

    .line 347
    :cond_c
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 348
    .local v8, "phoneId":I
    invoke-virtual {p0, v8}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->activate(I)V

    .line 349
    .end local v8    # "phoneId":I
    goto :goto_4

    .line 351
    :cond_d
    :goto_5
    if-eqz v5, :cond_e

    .line 352
    iput-boolean v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    .line 356
    .end local v1    # "newActivePhones":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "activateDdsPhone":Z
    :cond_e
    return-void
.end method

.method protected onResendDataAllowed(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 434
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 435
    .local v0, "phoneId":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mCommandsInterfaces:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneStates:[Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/android/internal/telephony/PhoneSwitcher$PhoneState;->active:Z

    .line 436
    const/16 v3, 0x71

    const/4 v4, 0x0

    invoke-virtual {p0, v3, v0, v4}, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->obtainMessage(III)Landroid/os/Message;

    move-result-object v3

    .line 435
    invoke-interface {v1, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->setDataAllowed(ZLandroid/os/Message;)V

    .line 437
    return-void
.end method

.method protected phoneIdForRequest(Landroid/net/NetworkRequest;I)I
    .locals 7
    .param p1, "netRequest"    # Landroid/net/NetworkRequest;
    .param p2, "apnid"    # I

    .line 361
    const/4 v0, 0x0

    .line 363
    .local v0, "specifier":Ljava/lang/String;
    iget-object v1, p1, Landroid/net/NetworkRequest;->networkCapabilities:Landroid/net/NetworkCapabilities;

    invoke-virtual {v1}, Landroid/net/NetworkCapabilities;->getNetworkSpecifier()Landroid/net/NetworkSpecifier;

    move-result-object v1

    .line 364
    .local v1, "networkSpecifierObj":Landroid/net/NetworkSpecifier;
    if-eqz v1, :cond_0

    instance-of v2, v1, Landroid/net/StringNetworkSpecifier;

    if-eqz v2, :cond_0

    .line 365
    move-object v2, v1

    check-cast v2, Landroid/net/StringNetworkSpecifier;

    iget-object v0, v2, Landroid/net/StringNetworkSpecifier;->specifier:Ljava/lang/String;

    .line 368
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, -0x1

    if-eqz v2, :cond_1

    .line 369
    iget v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataSubscription:I

    .local v2, "subId":I
    :goto_0
    goto :goto_1

    .line 371
    .end local v2    # "subId":I
    :cond_1
    const/4 v2, 0x5

    if-ne v2, p2, :cond_2

    iget-boolean v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mManualDdsSwitch:Z

    if-eqz v2, :cond_2

    iget v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mMaxActivePhones:I

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-eq v2, v4, :cond_2

    .line 372
    iget v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mDefaultDataSubscription:I

    goto :goto_0

    .line 375
    :cond_2
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 379
    .restart local v2    # "subId":I
    goto :goto_1

    .line 376
    .end local v2    # "subId":I
    :catch_0
    move-exception v2

    .line 377
    .local v2, "e":Ljava/lang/NumberFormatException;
    const-string v4, "PhoneSwitcher"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "NumberFormatException on "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    nop

    .end local v2    # "e":Ljava/lang/NumberFormatException;
    move v2, v3

    .line 382
    .local v2, "subId":I
    :goto_1
    const/4 v4, -0x1

    .line 383
    .local v4, "phoneId":I
    if-ne v2, v3, :cond_3

    return v4

    .line 385
    :cond_3
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    iget v5, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mNumPhones:I

    if-ge v3, v5, :cond_5

    .line 386
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/QtiPhoneSwitcher;->mPhoneSubscriptions:[I

    aget v5, v5, v3

    if-ne v5, v2, :cond_4

    .line 387
    move v4, v3

    .line 388
    goto :goto_3

    .line 385
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 391
    .end local v3    # "i":I
    :cond_5
    :goto_3
    return v4
.end method
