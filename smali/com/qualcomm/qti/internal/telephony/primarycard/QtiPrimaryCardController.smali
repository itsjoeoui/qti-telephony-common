.class public Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;
.super Landroid/os/Handler;
.source "QtiPrimaryCardController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;
    }
.end annotation


# static fields
.field private static final ACTION_PRIMARY_CARD_CHANGED_IN_SERVICE:Ljava/lang/String; = "org.codeaurora.intent.action.PRIMARY_CARD_CHANGED_IN_SERVICE"

.field private static final ACTION_RADIO_CAPABILITY_UPDATED:Ljava/lang/String; = "org.codeaurora.intent.action.ACTION_RADIO_CAPABILITY_UPDATED"

.field private static final ACTION_SET_PRIMARY_CARD_DONE:Ljava/lang/String; = "org.codeaurora.intent.action.ACTION_SET_PRIMARY_CARD_DONE"

.field private static final DBG:Z = true

.field private static final EVENT_ALL_CARDS_INFO_AVAILABLE:I = 0x1

.field private static final EVENT_GET_NWMODE_DONE:I = 0x4

.field private static final EVENT_OEM_HOOK_SERVICE_READY:I = 0x8

.field private static final EVENT_PRIMARY_CARD_SET_DONE:I = 0x5

.field private static final EVENT_SERVICE_STATE_CHANGED:I = 0x7

.field private static final EVENT_SET_NWMODE_DONE:I = 0x3

.field private static final EVENT_SET_PRIMARY_SUB:I = 0x6

.field private static final EVENT_SET_RADIO_CAPABILITY_DONE:I = 0x2

.field private static final FWK_PRIMARY_CARD_REQUEST:I = 0x3e8

.field private static final LOG_TAG:Ljava/lang/String; = "QtiPcController"

.field private static final PRIMARYCARD_SUBSCRIPTION_KEY:Ljava/lang/String; = "primarycard_sub"

.field private static final PRIMARY_CARD_RESULT:Ljava/lang/String; = "result"

.field private static final SETTING_USER_PREF_DATA_SUB:Ljava/lang/String; = "user_preferred_data_sub"

.field private static final USER_PRIMARY_CARD_REQUEST:I = 0x3e9

.field private static final VDBG:Z = false

.field private static final sCmccIins:[I

.field private static final sCtIins:[I

.field private static sInstance:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;


# instance fields
.field private mCardChanged:Z

.field mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

.field private mCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private mCmdMessage:Landroid/os/Message;

.field private final mContext:Landroid/content/Context;

.field private mCurrentIccIds:[Ljava/lang/String;

.field private mIsLpluslSupport:Z

.field private mPcTriggeredFlexMapDone:Z

.field mPcUtils:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;

.field private mPhone:[Lcom/android/internal/telephony/Phone;

.field private mPrefNwModes:[I

.field private mPrefPrimarySlot:I

.field private mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

.field mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

.field private mPriorityMatch:Z

.field private mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mRetryArray:[I

.field private mRetryCount:I

.field private mRetryPrimarySlot:I

.field mSubsidyLockSettingsObserver:Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 87
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sCtIins:[I

    .line 88
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sCmccIins:[I

    return-void

    nop

    :array_0
    .array-data 4
        0xdb62b
        0xdb633
    .end array-data

    :array_1
    .array-data 4
        0xdb628
        0xdb62a
        0xdb62f
        0xdb630
        0xdb5d9
        0xdb4a4
    .end array-data
.end method

.method private constructor <init>(Landroid/content/Context;[Lcom/android/internal/telephony/Phone;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "phones"    # [Lcom/android/internal/telephony/Phone;
    .param p3, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .line 127
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 66
    const/4 v0, -0x1

    iput v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardChanged:Z

    .line 70
    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    .line 71
    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPcTriggeredFlexMapDone:Z

    .line 75
    const/4 v1, 0x5

    new-array v1, v1, [I

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryArray:[I

    .line 78
    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mIsLpluslSupport:Z

    .line 105
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IDLE:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 152
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$1;

    invoke-direct {v0, p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$1;-><init>(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;)V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 128
    iput-object p1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    .line 129
    iput-object p2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    .line 130
    iput-object p3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    .line 131
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->init(Landroid/content/Context;)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPcUtils:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;

    .line 132
    new-instance v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    .line 133
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-static {v0, p3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->init(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    move-result-object v0

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    .line 134
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, p0, v2, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->registerAllCardsInfoAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 135
    sget v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    .line 136
    sget v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCurrentIccIds:[Ljava/lang/String;

    .line 138
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->resetPrimaryCardParams()V

    .line 140
    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.ACTION_SET_RADIO_CAPABILITY_DONE"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 142
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;->isSubsidyLockFeatureEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 143
    new-instance v2, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;

    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mSubsidyLockSettingsObserver:Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;

    .line 144
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mSubsidyLockSettingsObserver:Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;

    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    invoke-virtual {v2, v3, v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;->observe(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;)V

    .line 146
    :cond_0
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 148
    invoke-static {p1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getInstance(Landroid/content/Context;)Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 149
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    const/16 v3, 0x8

    invoke-virtual {v2, p0, v3, v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->registerForServiceReadyEvent(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 150
    return-void

    nop

    :array_0
    .array-data 4
        0x2
        0x5
        0xa
        0x14
        0x1e
    .end array-data
.end method

.method static synthetic access$000(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;
    .param p1, "x1"    # Ljava/lang/String;

    .line 41
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    .line 41
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->triggerPrimaryCardIfRequired()V

    return-void
.end method

.method static synthetic access$200(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;)I
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    .line 41
    iget v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryPrimarySlot:I

    return v0
.end method

.method static synthetic access$300(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;)I
    .locals 1
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    .line 41
    iget v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    return v0
.end method

.method static synthetic access$400(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;ZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(ZZ)V

    return-void
.end method

.method static synthetic access$500(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;)V
    .locals 0
    .param p0, "x0"    # Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    .line 41
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->resetSetNwModeFailureCount()V

    return-void
.end method

.method public static getInstance()Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;
    .locals 3

    .line 117
    const-class v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    monitor-enter v0

    .line 118
    :try_start_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sInstance:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    if-eqz v1, :cond_0

    .line 121
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sInstance:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    monitor-exit v0

    return-object v1

    .line 119
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "QtiPrimaryCardController was not initialized!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 122
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private handleGetNwModeDone(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 288
    const/4 v0, -0x1

    .line 289
    .local v0, "modemNwMode":I
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/AsyncResult;

    .line 290
    .local v1, "ar":Landroid/os/AsyncResult;
    iget-object v2, v1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 291
    .local v2, "index":I
    iget-object v3, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v3, :cond_0

    .line 292
    iget-object v3, v1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    const/4 v4, 0x0

    aget v0, v3, v4

    .line 293
    invoke-direct {p0, v0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->saveNwModesToDB(II)V

    .line 295
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "got nwMode:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " on slot"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", saved to DB, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method private handleOnSetPrimaryCardDone(Landroid/os/Message;)V
    .locals 9
    .param p1, "msg"    # Landroid/os/Message;

    .line 384
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 385
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 386
    .local v1, "index":I
    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v2, :cond_8

    .line 388
    invoke-static {v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->savePrimarySlotToDB(I)V

    .line 389
    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->broadcastPrimarySlotServiceChanged(I)V

    .line 391
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getUserSelectionMode()I

    move-result v2

    .line 392
    .local v2, "userSelectionMode":I
    const/4 v3, 0x0

    .line 394
    .local v3, "enableUserSelection":Z
    const/4 v4, 0x0

    .line 395
    .local v4, "numCmccCards":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    sget v6, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v5, v6, :cond_1

    .line 396
    iget-object v6, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    invoke-virtual {v6, v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->getCardInfo(I)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;

    move-result-object v6

    invoke-virtual {v6}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;->getIccId()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sCmccIins:[I

    invoke-direct {p0, v6, v7}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->isCardMatchesIins(Ljava/lang/String;[I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 397
    add-int/lit8 v4, v4, 0x1

    .line 395
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 405
    .end local v5    # "i":I
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "userSelectionMode = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ", mPriorityMatch"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v6, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, ", numCmccCards = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 407
    const/4 v5, 0x3

    if-eq v2, v5, :cond_2

    const/4 v5, 0x2

    if-ne v2, v5, :cond_3

    iget-boolean v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    if-eqz v5, :cond_3

    .line 410
    :cond_2
    const/4 v3, 0x1

    .line 413
    :cond_3
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x112008f

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_6

    .line 415
    if-nez v4, :cond_4

    const/4 v3, 0x1

    .line 416
    :cond_4
    invoke-static {v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->saveEnableUserSelectioninDB(Z)V

    .line 417
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "handleOnSetPrimaryCardDone: enableUserSelection ="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ", mCardChanged:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v7, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardChanged:Z

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v7, ", numCardsValid:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->numCardsValid()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 417
    invoke-direct {p0, v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 420
    if-eqz v3, :cond_5

    iget-boolean v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardChanged:Z

    if-eqz v5, :cond_5

    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->numCardsValid()I

    move-result v5

    if-le v5, v6, :cond_5

    iget-boolean v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    if-eqz v5, :cond_5

    .line 421
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->startLTEConifgActivity()V

    .line 424
    :cond_5
    return-void

    .line 427
    :cond_6
    invoke-static {v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->saveEnableUserSelectioninDB(Z)V

    .line 429
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;->isSubsidyLockFeatureEnabled()Z

    move-result v5

    .line 430
    .local v5, "subsidyLockFeatureEnabled":Z
    const/4 v7, 0x1

    .line 431
    .local v7, "isPermanentlyUnlocked":Z
    if-eqz v5, :cond_7

    .line 432
    iget-object v8, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mSubsidyLockSettingsObserver:Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;

    iget-object v8, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    .line 433
    invoke-static {v8}, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;->isPermanentlyUnlocked(Landroid/content/Context;)Z

    move-result v7

    .line 436
    :cond_7
    if-eqz v3, :cond_8

    iget-boolean v8, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardChanged:Z

    if-eqz v8, :cond_8

    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->numCardsValid()I

    move-result v8

    if-le v8, v6, :cond_8

    if-eqz v7, :cond_8

    .line 438
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->startLTEConifgActivity()V

    .line 441
    .end local v2    # "userSelectionMode":I
    .end local v3    # "enableUserSelection":Z
    .end local v4    # "numCmccCards":I
    .end local v5    # "subsidyLockFeatureEnabled":Z
    .end local v7    # "isPermanentlyUnlocked":Z
    :cond_8
    return-void
.end method

.method private handleServiceStateChanged(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .line 359
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 361
    .local v0, "ar":Landroid/os/AsyncResult;
    if-eqz v0, :cond_1

    .line 362
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    .line 363
    invoke-static {v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getCurrentPrimarySlotFromDB(Landroid/content/Context;)I

    move-result v1

    .line 364
    .local v1, "currentPrimarySlot":I
    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 366
    .local v2, "slotId":I
    invoke-static {v2}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 367
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v3, v3, v2

    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/Phone;->unregisterForServiceStateChanged(Landroid/os/Handler;)V

    goto :goto_0

    .line 369
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Error, Invalid slotId "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 371
    :goto_0
    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->broadcastPrimarySlotServiceChanged(I)V

    .line 373
    .end local v1    # "currentPrimarySlot":I
    .end local v2    # "slotId":I
    :cond_1
    return-void
.end method

.method private handleSetNwModeDone(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .line 235
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 236
    .local v0, "ar":Landroid/os/AsyncResult;
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 237
    .local v1, "index":I
    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 238
    .local v2, "requestType":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "set "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " for slot "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " done, "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 239
    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    .line 240
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryCount:I

    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryArray:[I

    array-length v5, v5

    if-gt v3, v5, :cond_0

    const/16 v3, 0x3e8

    if-ne v2, v3, :cond_0

    .line 242
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryArray:[I

    iget v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryCount:I

    add-int/lit8 v5, v5, -0x1

    aget v4, v4, v5

    mul-int/2addr v4, v3

    .line 243
    .local v4, "delay":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Scheduling retry for failed set primary card request: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " ms"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 244
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    iput v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryPrimarySlot:I

    .line 245
    new-instance v3, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$2;

    invoke-direct {v3, p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$2;-><init>(Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;)V

    int-to-long v5, v4

    invoke-virtual {p0, v3, v5, v6}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 256
    .end local v4    # "delay":I
    goto :goto_1

    .line 257
    :cond_0
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->resetSetNwModeFailureCount()V

    .line 258
    nop

    .local v4, "i":I
    :goto_0
    move v3, v4

    .end local v4    # "i":I
    .local v3, "i":I
    sget v4, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v3, v4, :cond_1

    .line 259
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v4, v4, v3

    const/4 v5, 0x4

    .line 260
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 259
    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/Phone;->getPreferredNetworkType(Landroid/os/Message;)V

    .line 258
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_0

    .line 262
    .end local v4    # "i":I
    :cond_1
    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sendSetPrimaryCardResult(I)V

    .line 264
    :goto_1
    return-void

    .line 266
    :cond_2
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryCount:I

    if-lez v3, :cond_3

    .line 267
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->resetSetNwModeFailureCount()V

    .line 271
    :cond_3
    iget-boolean v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPcTriggeredFlexMapDone:Z

    if-nez v3, :cond_5

    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    if-ne v1, v3, :cond_4

    goto :goto_2

    .line 276
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "set NwMode["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    iget v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    aget v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "] on Primarycard:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 278
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    iget v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    aget-object v3, v3, v4

    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    iget v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    aget v4, v4, v5

    const/4 v5, 0x3

    iget v6, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    .line 279
    invoke-virtual {p0, v5, v6, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    .line 278
    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V

    goto :goto_3

    .line 273
    :cond_5
    :goto_2
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setDdsOnPrimaryCardIfRequired()V

    .line 274
    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sendSetPrimaryCardResult(I)V

    .line 281
    :goto_3
    return-void
.end method

.method private handleSetRadioCapsDone()V
    .locals 2

    .line 220
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_FLEXMAP_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-ne v0, v1, :cond_0

    .line 223
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IDLE:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 224
    const-string v0, "Flex mapping completed, try setting primary card now"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 225
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(Z)V

    goto :goto_0

    .line 226
    :cond_0
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_PC_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-ne v0, v1, :cond_2

    .line 229
    :cond_1
    const-string v0, "Primary card trigerred Flex Mapping completed."

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 230
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPcTriggeredFlexMapDone:Z

    .line 232
    :cond_2
    :goto_0
    return-void
.end method

.method private haveCMCCSimCard()Z
    .locals 6

    .line 452
    const/4 v0, 0x0

    move v1, v0

    .local v1, "i":I
    :goto_0
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->numCardsValid()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 453
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    invoke-virtual {v2, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->getCardInfo(I)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;->getIccId()Ljava/lang/String;

    move-result-object v2

    .line 454
    .local v2, "iccId":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 455
    const/4 v3, 0x6

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 456
    .local v3, "subIccId":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "iccId is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " on slot"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 457
    const-string v4, "898600"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "898602"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "898607"

    .line 458
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "898608"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 459
    :cond_0
    const/4 v0, 0x1

    return v0

    .line 452
    .end local v2    # "iccId":Ljava/lang/String;
    .end local v3    # "subIccId":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 464
    .end local v1    # "i":I
    :cond_2
    return v0
.end method

.method public static init(Landroid/content/Context;[Lcom/android/internal/telephony/Phone;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "phones"    # [Lcom/android/internal/telephony/Phone;
    .param p2, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .line 109
    const-class v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    monitor-enter v0

    .line 110
    :try_start_0
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sInstance:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    if-nez v1, :cond_0

    invoke-static {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->isPrimaryCardFeatureEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    new-instance v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    invoke-direct {v1, p0, p1, p2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;-><init>(Landroid/content/Context;[Lcom/android/internal/telephony/Phone;[Lcom/android/internal/telephony/CommandsInterface;)V

    sput-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sInstance:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;

    .line 113
    :cond_0
    monitor-exit v0

    .line 114
    return-void

    .line 113
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isCardMatchesIins(Ljava/lang/String;[I)Z
    .locals 5
    .param p1, "iccId"    # Ljava/lang/String;
    .param p2, "iins"    # [I

    .line 517
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 520
    :cond_0
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 521
    .local v1, "cardIin":I
    array-length v2, p2

    move v3, v0

    :goto_0
    if-ge v3, v2, :cond_2

    aget v4, p2, v3

    .line 522
    .local v4, "iin":I
    if-ne v4, v1, :cond_1

    const/4 v0, 0x1

    return v0

    .line 521
    .end local v4    # "iin":I
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 524
    :cond_2
    return v0

    .line 518
    .end local v1    # "cardIin":I
    :cond_3
    :goto_1
    return v0
.end method

.method private isCardsInfoChanged()Z
    .locals 3

    .line 703
    const/4 v0, 0x0

    .line 704
    .local v0, "cardChanged":Z
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    sget v2, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v1, v2, :cond_1

    .line 705
    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->isCardsInfoChanged(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 706
    const/4 v0, 0x1

    .line 704
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 709
    .end local v1    # "index":I
    :cond_1
    return v0
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 731
    const-string v0, "QtiPcController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 732
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 739
    const-string v0, "QtiPcController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 740
    return-void
.end method

.method private logi(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .line 735
    const-string v0, "QtiPcController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    return-void
.end method

.method private notifySetPrimaryCardDone(Z)V
    .locals 3
    .param p1, "isPass"    # Z

    .line 376
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "notifySetPrimaryCardDone: Set Primary Card SUCCESS: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 377
    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.codeaurora.intent.action.ACTION_SET_PRIMARY_CARD_DONE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 378
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "result"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 379
    const-string v1, "phone"

    iget v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 380
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 381
    return-void
.end method

.method private numCardsValid()I
    .locals 3

    .line 486
    const/4 v0, 0x0

    .line 487
    .local v0, "numCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget v2, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v1, v2, :cond_1

    .line 488
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    invoke-virtual {v2, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->getCardInfo(I)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;->getIccId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    .line 487
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 490
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method private resetPrimaryCardParams()V
    .locals 3

    .line 528
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    .line 529
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    .line 530
    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPcTriggeredFlexMapDone:Z

    .line 531
    nop

    .local v0, "i":I
    :goto_0
    sget v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v0, v1, :cond_0

    .line 532
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getDefaultNwMode()I

    move-result v2

    aput v2, v1, v0

    .line 531
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 534
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private resetSetNwModeFailureCount()V
    .locals 1

    .line 284
    const/4 v0, 0x0

    iput v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mRetryCount:I

    .line 285
    return-void
.end method

.method private saveCardIccIdInfoInSp()V
    .locals 5

    .line 721
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v0, v1, :cond_0

    .line 722
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCurrentIccIds:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 724
    .local v1, "iccId":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "save IccId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", on slotId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", in SP."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 725
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "primarycard_sub"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 726
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 721
    .end local v1    # "iccId":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 728
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private saveNwModesToDB(II)V
    .locals 5
    .param p1, "nwMode"    # I
    .param p2, "slotId"    # I

    .line 685
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getSubId(I)[I

    move-result-object v0

    .line 686
    .local v0, "subId":[I
    if-eqz v0, :cond_0

    .line 687
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveNwModesToDB: subId["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    aget v3, v0, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", new Nw mode = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 689
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v1

    aget v3, v0, v2

    invoke-virtual {v1, v3}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isActiveSubId(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 690
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "preferred_network_mode"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v2, v0, v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    .line 695
    :cond_0
    const-string v1, "saveNwModesToDB: subId is null, do not save nwMode in subId based DB"

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->loge(Ljava/lang/String;)V

    .line 697
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "preferred_network_mode"

    invoke-static {v1, v2, p2, p1}, Landroid/telephony/TelephonyManager;->putIntAtIndex(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .line 700
    return-void
.end method

.method private sendSetPrimaryCardResult(I)V
    .locals 3
    .param p1, "responseCode"    # I

    .line 309
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    if-eqz v0, :cond_0

    .line 310
    invoke-static {p1}, Lcom/android/internal/telephony/CommandException;->fromRilErrno(I)Lcom/android/internal/telephony/CommandException;

    move-result-object v0

    .line 311
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 312
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 313
    iput-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    .line 316
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 317
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->saveCardIccIdInfoInSp()V

    .line 318
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->notifySetPrimaryCardDone(Z)V

    .line 319
    iget v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    invoke-static {v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->savePrimarySlotToDB(I)V

    .line 320
    iget v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    invoke-virtual {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->broadcastPrimarySlotServiceChanged(I)V

    goto :goto_0

    .line 322
    :cond_1
    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->notifySetPrimaryCardDone(Z)V

    .line 325
    :goto_0
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v2, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_PC_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-ne v1, v2, :cond_2

    .line 326
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IDLE:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 327
    const-string v1, "Primary Card request completed, check for pending reqeusts"

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 328
    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(Z)V

    goto :goto_1

    .line 329
    :cond_2
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-ne v0, v1, :cond_3

    .line 330
    sget-object v0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IDLE:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 332
    :cond_3
    :goto_1
    return-void
.end method

.method private setDdsOnPrimaryCardIfRequired()V
    .locals 4

    .line 299
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v0

    .line 301
    .local v0, "subCtrlr":Lcom/android/internal/telephony/SubscriptionController;
    iget v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SubscriptionController;->getSubIdUsingPhoneId(I)I

    move-result v1

    .line 302
    .local v1, "subId":I
    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SubscriptionController;->setDefaultDataSubId(I)V

    .line 303
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "user_preferred_data_sub"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Global;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 305
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cofigure DDS on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 306
    return-void
.end method

.method private setPrimaryCardIfRequired(Z)V
    .locals 1
    .param p1, "force"    # Z

    .line 541
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(ZZ)V

    .line 542
    return-void
.end method

.method private setPrimaryCardIfRequired(ZZ)V
    .locals 7
    .param p1, "force"    # Z
    .param p2, "isRetryRequest"    # Z

    .line 548
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setPrimaryCardIfRequired: force: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 549
    const/4 v0, -0x1

    .line 551
    .local v0, "slotId":I
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v2, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v2, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_PC_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-ne v1, v2, :cond_1

    :cond_0
    if-nez p2, :cond_1

    .line 558
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_PC_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 559
    const-string v1, "Primary Card setting in progress. WAIT!"

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 560
    return-void

    .line 561
    :cond_1
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v1

    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->isFlexMapInProgress()Z

    move-result v1

    if-nez v1, :cond_e

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v2, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_FLEXMAP_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-ne v1, v2, :cond_2

    goto/16 :goto_6

    .line 568
    :cond_2
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;

    move-result-object v1

    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiUiccCardProvisioner;->isAnyProvisionRequestInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 571
    const-string v1, "Manual provisioning in progress. EXIT!"

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 572
    return-void

    .line 575
    :cond_3
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->isCardsInfoChanged()Z

    move-result v1

    .line 577
    .local v1, "isCardChanged":Z
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/SubsidyLockSettingsObserver;->isSubsidyLockFeatureEnabled()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_5

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    move v2, v4

    goto :goto_1

    :cond_5
    :goto_0
    move v2, v3

    .line 578
    .local v2, "override":Z
    :goto_1
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    if-nez v2, :cond_7

    if-eqz v1, :cond_6

    goto :goto_2

    :cond_6
    move v6, v4

    goto :goto_3

    :cond_7
    :goto_2
    move v6, v3

    :goto_3
    invoke-virtual {v5, v6}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;->loadCurrentPriorityConfigs(Z)V

    .line 581
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    invoke-virtual {v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;->getPrefPrimarySlot()I

    move-result v5

    iput v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    .line 582
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mPrefPrimarySlot: setPrimaryCardIfRequired: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->loge(Ljava/lang/String;)V

    .line 585
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v5}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getLpluslSupportStatus()Z

    move-result v5

    if-eqz v5, :cond_8

    goto :goto_4

    .line 586
    :cond_8
    iget v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_9

    move v4, v3

    nop

    .line 587
    .local v4, "isSetable":Z
    :cond_9
    :goto_4
    invoke-static {v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->savePrimarySetable(Z)V

    .line 589
    if-nez v1, :cond_a

    if-nez p2, :cond_a

    if-nez p1, :cond_a

    .line 590
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "primary card "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getCurrentPrimarySlotFromDB(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " ,Cards not changed, IGNORE!!"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 592
    return-void

    .line 594
    :cond_a
    iput-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardChanged:Z

    .line 596
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->resetPrimaryCardParams()V

    .line 599
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->updateDdsPreferenceInDb()V

    .line 601
    iget v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    const/4 v6, -0x2

    if-ne v5, v6, :cond_b

    .line 602
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getDefaultPrimarySlot()I

    move-result v5

    iput v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    .line 603
    iput-boolean v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    goto :goto_5

    .line 604
    :cond_b
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    if-gez v3, :cond_d

    .line 605
    const-string v3, "Both slots do not have cards with priority config defined. EXIT!"

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 608
    if-eqz p2, :cond_c

    .line 609
    const/4 v3, 0x2

    invoke-direct {p0, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sendSetPrimaryCardResult(I)V

    .line 610
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->resetSetNwModeFailureCount()V

    .line 612
    :cond_c
    return-void

    .line 615
    :cond_d
    :goto_5
    iget v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    const/4 v5, 0x5

    iget v6, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    .line 616
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0, v5, v6}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 615
    invoke-direct {p0, v3, v5, p2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardOnSlot(ILandroid/os/Message;Z)V

    .line 618
    return-void

    .line 565
    .end local v1    # "isCardChanged":Z
    .end local v2    # "override":Z
    .end local v4    # "isSetable":Z
    :cond_e
    :goto_6
    sget-object v1, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->PENDING_DUE_TO_FLEXMAP_IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 566
    const-string v1, "Flex Map in progress. WAIT!"

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 567
    return-void
.end method

.method private declared-synchronized setPrimaryCardOnSlot(ILandroid/os/Message;)V
    .locals 1
    .param p1, "slotId"    # I
    .param p2, "msg"    # Landroid/os/Message;

    monitor-enter p0

    .line 632
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardOnSlot(ILandroid/os/Message;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 633
    monitor-exit p0

    return-void

    .line 631
    .end local p1    # "slotId":I
    .end local p2    # "msg":Landroid/os/Message;
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;
    throw p1
.end method

.method private declared-synchronized setPrimaryCardOnSlot(ILandroid/os/Message;Z)V
    .locals 7
    .param p1, "primarySlotId"    # I
    .param p2, "msg"    # Landroid/os/Message;
    .param p3, "isRetryRequest"    # Z

    monitor-enter p0

    .line 637
    :try_start_0
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v0

    .line 638
    .local v0, "subCtrlr":Lcom/android/internal/telephony/SubscriptionController;
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/SubscriptionController;->getSubIdUsingPhoneId(I)I

    move-result v1

    .line 640
    .local v1, "subId":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setPrimaryCardOnSlot: for slotId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", Start."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 642
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    sget-object v3, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IDLE:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    if-eq v2, v3, :cond_0

    if-eqz p3, :cond_7

    :cond_0
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    .line 643
    invoke-virtual {v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;->isConfigLoadDone()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 644
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SubscriptionController;->isActiveSubId(I)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_4

    .line 653
    :cond_1
    const/4 v2, 0x0

    if-nez p2, :cond_2

    .line 654
    move v3, v2

    .local v3, "i":I
    :goto_0
    sget v4, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v3, v4, :cond_2

    .line 655
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCurrentIccIds:[Ljava/lang/String;

    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    invoke-virtual {v5, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->getCardInfo(I)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;

    move-result-object v5

    invoke-virtual {v5}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;->getIccId()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    .line 654
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 659
    .end local v3    # "i":I
    :cond_2
    sget-object v3, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;->IN_PROGRESS:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    iput-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    .line 662
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    invoke-virtual {v3, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;->getNwModesFromConfig(I)[I

    move-result-object v3

    iput-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    .line 663
    iput p1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefPrimarySlot:I

    .line 664
    iput-object p2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    .line 665
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCmdMessage:Landroid/os/Message;

    if-eqz v3, :cond_3

    const/16 v3, 0x3e8

    goto :goto_1

    :cond_3
    const/16 v3, 0x3e9

    .line 666
    .local v3, "isFwkRequest":I
    :goto_1
    iput-boolean v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPcTriggeredFlexMapDone:Z

    .line 669
    move v4, v2

    .local v4, "i":I
    :goto_2
    sget v5, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v4, v5, :cond_4

    .line 670
    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    aget v5, v5, v4

    invoke-direct {p0, v5, v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->saveNwModesToDB(II)V

    .line 669
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 675
    .end local v4    # "i":I
    :cond_4
    nop

    .local v2, "index":I
    :goto_3
    sget v4, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v2, v4, :cond_6

    .line 676
    if-eq v2, p1, :cond_5

    .line 677
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "set NwMode["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    aget v5, v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "]  on Secondary card:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 678
    iget-object v4, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v4, v4, v2

    iget-object v5, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrefNwModes:[I

    aget v5, v5, v2

    const/4 v6, 0x3

    .line 679
    invoke-virtual {p0, v6, v2, v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->obtainMessage(III)Landroid/os/Message;

    move-result-object v6

    .line 678
    invoke-virtual {v4, v5, v6}, Lcom/android/internal/telephony/Phone;->setPreferredNetworkType(ILandroid/os/Message;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 675
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 682
    .end local v2    # "index":I
    :cond_6
    monitor-exit p0

    return-void

    .line 645
    .end local v3    # "isFwkRequest":I
    :cond_7
    :goto_4
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Primary Card State is not IDLE, mPrimaryCardState:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPrimaryCardState:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController$PrimaryCardState;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " subId: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", or configs not yet loaded EXIT!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->loge(Ljava/lang/String;)V

    .line 647
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sendSetPrimaryCardResult(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 648
    monitor-exit p0

    return-void

    .line 636
    .end local v0    # "subCtrlr":Lcom/android/internal/telephony/SubscriptionController;
    .end local v1    # "subId":I
    .end local p1    # "primarySlotId":I
    .end local p2    # "msg":Landroid/os/Message;
    .end local p3    # "isRetryRequest":Z
    :catchall_0
    move-exception p1

    monitor-exit p0

    .end local p0    # "this":Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;
    throw p1
.end method

.method private startLTEConifgActivity()V
    .locals 2

    .line 444
    new-instance v0, Landroid/content/Intent;

    const-string v1, "codeaurora.intent.action.ACTION_LTE_CONFIGURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 445
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x30800000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 448
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 449
    return-void
.end method

.method private triggerPrimaryCardIfRequired()V
    .locals 2

    .line 166
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->isServiceReady()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mIsLpluslSupport:Z

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    .line 167
    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getLpluslSupportStatus()Z

    move-result v1

    if-eq v0, v1, :cond_0

    .line 168
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;->reloadPriorityConfig()V

    .line 169
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(Z)V

    .line 170
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getLpluslSupportStatus()Z

    move-result v0

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mIsLpluslSupport:Z

    .line 172
    :cond_0
    return-void
.end method

.method private updateDdsPreferenceInDb()V
    .locals 5

    .line 494
    const/4 v0, 0x0

    .line 495
    .local v0, "disableDds":Z
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->isCmccPrimaryCardFeatureEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 496
    const/4 v1, 0x0

    .line 497
    .local v1, "numCmccCards":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget v3, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->PHONE_COUNT:I

    if-ge v2, v3, :cond_1

    .line 498
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    invoke-virtual {v3, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->getCardInfo(I)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;

    move-result-object v3

    invoke-virtual {v3}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;->getIccId()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sCmccIins:[I

    invoke-direct {p0, v3, v4}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->isCardMatchesIins(Ljava/lang/String;[I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 499
    add-int/lit8 v1, v1, 0x1

    .line 497
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 502
    .end local v2    # "i":I
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "numCmccCards: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 504
    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 505
    const-string v2, "updateDdsPreferenceInDb: Disable DDS in UI."

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logi(Ljava/lang/String;)V

    .line 506
    const/4 v0, 0x1

    .line 509
    .end local v1    # "numCmccCards":I
    :cond_2
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->disableDds()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 510
    const/4 v0, 0x1

    .line 512
    :cond_3
    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->saveDisableDdsPreferenceInDB(Z)V

    .line 513
    return-void
.end method


# virtual methods
.method broadcastPrimarySlotServiceChanged(I)V
    .locals 4
    .param p1, "slotId"    # I

    .line 335
    invoke-static {p1}, Landroid/telephony/SubscriptionManager;->isValidSlotIndex(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " Error!!! Invalid slotId "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 337
    return-void

    .line 340
    :cond_0
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v0, v0, p1

    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/Phone;->unregisterForServiceStateChanged(Landroid/os/Handler;)V

    .line 342
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v0

    .line 343
    .local v0, "ss":Landroid/telephony/ServiceState;
    if-eqz v0, :cond_2

    .line 344
    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getState()I

    move-result v1

    if-eqz v1, :cond_1

    .line 345
    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getDataRegState()I

    move-result v1

    if-nez v1, :cond_2

    .line 346
    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getDataNetworkType()I

    move-result v1

    const/16 v2, 0x12

    if-eq v1, v2, :cond_2

    .line 347
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " broadcastPrimarySlotServiceChanged, slotId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 349
    new-instance v1, Landroid/content/Intent;

    const-string v2, "org.codeaurora.intent.action.PRIMARY_CARD_CHANGED_IN_SERVICE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 350
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "phone"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 351
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 352
    .end local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 353
    :cond_2
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v1, v1, p1

    const/4 v2, 0x7

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v1, p0, v2, v3}, Lcom/android/internal/telephony/Phone;->registerForServiceStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 356
    :goto_0
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 176
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    .line 198
    :pswitch_0
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityHandler:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardPriorityHandler;->reloadPriorityConfig()V

    .line 199
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->isServiceReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mQtiRilInterface:Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiRilInterface;->getLpluslSupportStatus()Z

    move-result v0

    iput-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mIsLpluslSupport:Z

    .line 201
    iget-boolean v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mIsLpluslSupport:Z

    if-nez v0, :cond_0

    .line 202
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "org.codeaurora.intent.action.ACTION_RADIO_CAPABILITY_UPDATED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 204
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 207
    .end local v0    # "intentFilter":Landroid/content/IntentFilter;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "on EVENT_OEM_HOOK_SERVICE_READY and mIsLpluslSupport = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mIsLpluslSupport:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 208
    goto :goto_0

    .line 210
    :pswitch_1
    const-string v0, "on EVENT_SET_PRIMARY_SUB "

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 211
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(Z)V

    .line 213
    :pswitch_2
    const-string v0, "on EVENT_SERVICE_STATE_CHANGED "

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 214
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->handleServiceStateChanged(Landroid/os/Message;)V

    goto :goto_0

    .line 194
    :pswitch_3
    const-string v0, "on EVENT_PRIMARY_CARD_SET_DONE"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 195
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->handleOnSetPrimaryCardDone(Landroid/os/Message;)V

    .line 196
    goto :goto_0

    .line 190
    :pswitch_4
    const-string v0, "on EVENT_GET_NWMODE_DONE"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 191
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->handleGetNwModeDone(Landroid/os/Message;)V

    .line 192
    goto :goto_0

    .line 186
    :pswitch_5
    const-string v0, "on EVENT_SET_NWMODE_DONE"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 187
    invoke-direct {p0, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->handleSetNwModeDone(Landroid/os/Message;)V

    .line 188
    goto :goto_0

    .line 182
    :pswitch_6
    const-string v0, "on EVENT_SET_RADIO_CAPABILITY_DONE"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 183
    invoke-direct {p0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->handleSetRadioCapsDone()V

    .line 184
    goto :goto_0

    .line 178
    :pswitch_7
    const-string v0, "on EVENT_ALL_CARDS_INFO_AVAILABLE"

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 179
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardIfRequired(Z)V

    .line 180
    nop

    .line 217
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method protected isCardsInfoChanged(I)Z
    .locals 4
    .param p1, "phoneId"    # I

    .line 713
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCurrentIccIds:[Ljava/lang/String;

    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mCardInfoMgr:Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;

    invoke-virtual {v1, p1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager;->getCardInfo(I)Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiCardInfoManager$CardInfo;->getIccId()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, p1

    move-object v0, v1

    .line 714
    .local v0, "iccId":Ljava/lang/String;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "primarycard_sub"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 716
    .local v1, "iccIdInSP":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " phoneId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " icc id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", icc id in sp="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 717
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    return v2
.end method

.method public saveUserSelectionMode()V
    .locals 4

    .line 468
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->getUserSelectionMode()I

    move-result v0

    .line 469
    .local v0, "userSelectionMode":I
    const/4 v1, 0x0

    .line 475
    .local v1, "enableUserSelection":Z
    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    iget-boolean v2, p0, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->mPriorityMatch:Z

    if-eqz v2, :cond_1

    .line 478
    :cond_0
    const/4 v1, 0x1

    .line 480
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveUserSelectionMode: enableUserSelection ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->logd(Ljava/lang/String;)V

    .line 482
    invoke-static {v1}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardUtils;->saveEnableUserSelectioninDB(Z)V

    .line 483
    return-void
.end method

.method public setPrimaryCardOnSlot(I)V
    .locals 2
    .param p1, "slotId"    # I

    .line 622
    invoke-static {}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getInstance()Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->isRadioInValidState()Z

    move-result v0

    if-nez v0, :cond_0

    .line 623
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setPrimaryCardOnSlot["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]: Radio is in Invalid State, EXIT!!!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->loge(Ljava/lang/String;)V

    .line 624
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sendSetPrimaryCardResult(I)V

    .line 625
    return-void

    .line 628
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->setPrimaryCardOnSlot(ILandroid/os/Message;)V

    .line 629
    return-void
.end method

.method public trySetPrimarySub()V
    .locals 1

    .line 537
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/qualcomm/qti/internal/telephony/primarycard/QtiPrimaryCardController;->sendMessage(Landroid/os/Message;)Z

    .line 538
    return-void
.end method
