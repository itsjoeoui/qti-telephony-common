.class public Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;
.super Lvendor/qti/hardware/radio/qtiradio/V2_0/IQtiRadioResponse$Stub;
.source "QtiRadioResponse.java"


# static fields
.field static final QTI_RILJ_LOG_TAG:Ljava/lang/String; = "QtiRadioResponse"


# instance fields
.field mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;


# direct methods
.method public constructor <init>(Lcom/qualcomm/qti/internal/telephony/QtiRIL;)V
    .locals 0
    .param p1, "ril"    # Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    .line 30
    invoke-direct {p0}, Lvendor/qti/hardware/radio/qtiradio/V2_0/IQtiRadioResponse$Stub;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    .line 32
    return-void
.end method

.method private responseSms(Landroid/hardware/radio/V1_0/RadioResponseInfo;Landroid/hardware/radio/V1_0/SendSmsResult;)V
    .locals 6
    .param p1, "responseInfo"    # Landroid/hardware/radio/V1_0/RadioResponseInfo;
    .param p2, "sms"    # Landroid/hardware/radio/V1_0/SendSmsResult;

    .line 79
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiRIL;->qtiProcessResponse(Landroid/hardware/radio/V1_0/RadioResponseInfo;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "request":Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 81
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    invoke-virtual {v1, v0}, Lcom/qualcomm/qti/internal/telephony/QtiRIL;->qtiGetMessageFromRequest(Ljava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 82
    .local v1, "result":Landroid/os/Message;
    new-instance v2, Lcom/android/internal/telephony/SmsResponse;

    iget v3, p2, Landroid/hardware/radio/V1_0/SendSmsResult;->messageRef:I

    iget-object v4, p2, Landroid/hardware/radio/V1_0/SendSmsResult;->ackPDU:Ljava/lang/String;

    iget v5, p2, Landroid/hardware/radio/V1_0/SendSmsResult;->errorCode:I

    invoke-direct {v2, v3, v4, v5}, Lcom/android/internal/telephony/SmsResponse;-><init>(ILjava/lang/String;I)V

    .line 83
    .local v2, "ret":Lcom/android/internal/telephony/SmsResponse;
    iget v3, p1, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    if-nez v3, :cond_0

    .line 84
    invoke-static {v1, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->sendMessageResponse(Landroid/os/Message;Ljava/lang/Object;)V

    .line 86
    :cond_0
    iget-object v3, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    invoke-virtual {v3, v0, p1, v2}, Lcom/qualcomm/qti/internal/telephony/QtiRIL;->qtiProcessResponseDone(Ljava/lang/Object;Landroid/hardware/radio/V1_0/RadioResponseInfo;Ljava/lang/Object;)V

    .line 88
    .end local v1    # "result":Landroid/os/Message;
    .end local v2    # "ret":Lcom/android/internal/telephony/SmsResponse;
    :cond_1
    return-void
.end method

.method private responseString(Landroid/hardware/radio/V1_0/RadioResponseInfo;Ljava/lang/String;)V
    .locals 3
    .param p1, "responseInfo"    # Landroid/hardware/radio/V1_0/RadioResponseInfo;
    .param p2, "str"    # Ljava/lang/String;

    .line 56
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    invoke-virtual {v0, p1}, Lcom/qualcomm/qti/internal/telephony/QtiRIL;->qtiProcessResponse(Landroid/hardware/radio/V1_0/RadioResponseInfo;)Ljava/lang/Object;

    move-result-object v0

    .line 57
    .local v0, "request":Ljava/lang/Object;
    iget-object v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    invoke-virtual {v1, v0}, Lcom/qualcomm/qti/internal/telephony/QtiRIL;->qtiGetMessageFromRequest(Ljava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 58
    .local v1, "result":Landroid/os/Message;
    if-eqz v1, :cond_1

    .line 59
    iget v2, p1, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    if-nez v2, :cond_0

    .line 60
    invoke-static {v1, p2}, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->sendMessageResponse(Landroid/os/Message;Ljava/lang/Object;)V

    .line 62
    :cond_0
    iget-object v2, p0, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->mRil:Lcom/qualcomm/qti/internal/telephony/QtiRIL;

    invoke-virtual {v2, v0, p1, p2}, Lcom/qualcomm/qti/internal/telephony/QtiRIL;->qtiProcessResponseDone(Ljava/lang/Object;Landroid/hardware/radio/V1_0/RadioResponseInfo;Ljava/lang/Object;)V

    .line 64
    :cond_1
    return-void
.end method

.method static sendMessageResponse(Landroid/os/Message;Ljava/lang/Object;)V
    .locals 1
    .param p0, "msg"    # Landroid/os/Message;
    .param p1, "ret"    # Ljava/lang/Object;

    .line 40
    if-eqz p0, :cond_0

    .line 41
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 42
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 44
    :cond_0
    return-void
.end method

.method static toRadioResponseInfo(Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;)Landroid/hardware/radio/V1_0/RadioResponseInfo;
    .locals 2
    .param p0, "qtiResponseInfo"    # Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;

    .line 48
    new-instance v0, Landroid/hardware/radio/V1_0/RadioResponseInfo;

    invoke-direct {v0}, Landroid/hardware/radio/V1_0/RadioResponseInfo;-><init>()V

    .line 49
    .local v0, "responseInfo":Landroid/hardware/radio/V1_0/RadioResponseInfo;
    iget v1, p0, Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;->type:I

    iput v1, v0, Landroid/hardware/radio/V1_0/RadioResponseInfo;->type:I

    .line 50
    iget v1, p0, Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;->serial:I

    iput v1, v0, Landroid/hardware/radio/V1_0/RadioResponseInfo;->serial:I

    .line 51
    iget v1, p0, Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;->error:I

    iput v1, v0, Landroid/hardware/radio/V1_0/RadioResponseInfo;->error:I

    .line 52
    return-object v0
.end method


# virtual methods
.method public getAtrResponse(Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;Ljava/lang/String;)V
    .locals 2
    .param p1, "qtiResponseInfo"    # Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;
    .param p2, "atr"    # Ljava/lang/String;

    .line 72
    const-string v0, "QtiRadioResponse"

    const-string v1, "getAtrResponse"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-static {p1}, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->toRadioResponseInfo(Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;)Landroid/hardware/radio/V1_0/RadioResponseInfo;

    move-result-object v0

    .line 75
    .local v0, "responseInfo":Landroid/hardware/radio/V1_0/RadioResponseInfo;
    invoke-direct {p0, v0, p2}, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->responseString(Landroid/hardware/radio/V1_0/RadioResponseInfo;Ljava/lang/String;)V

    .line 76
    return-void
.end method

.method public on5gStatusResponse(III)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "enabled"    # I

    .line 116
    return-void
.end method

.method public onDisable5gResponse(III)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "status"    # I

    .line 108
    return-void
.end method

.method public onEnable5gOnlyResponse(III)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "status"    # I

    .line 112
    return-void
.end method

.method public onEnable5gResponse(III)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "status"    # I

    .line 104
    return-void
.end method

.method public onNrBearerAllocationResponse(III)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "bearerStatus"    # I

    .line 125
    return-void
.end method

.method public onNrDcParamResponse(IILvendor/qti/hardware/radio/qtiradio/V2_0/DcParam;)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "dcParam"    # Lvendor/qti/hardware/radio/qtiradio/V2_0/DcParam;

    .line 121
    return-void
.end method

.method public onSignalStrengthResponse(IILvendor/qti/hardware/radio/qtiradio/V2_0/SignalStrength;)V
    .locals 0
    .param p1, "serial"    # I
    .param p2, "errorCode"    # I
    .param p3, "signalStrength"    # Lvendor/qti/hardware/radio/qtiradio/V2_0/SignalStrength;

    .line 130
    return-void
.end method

.method public sendCdmaSmsResponse(Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;Landroid/hardware/radio/V1_0/SendSmsResult;)V
    .locals 4
    .param p1, "qtiResponseInfo"    # Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;
    .param p2, "sms"    # Landroid/hardware/radio/V1_0/SendSmsResult;

    .line 96
    const-string v0, "QtiRadioResponse"

    const-string v1, "sendCdmaSmsResponse"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    invoke-static {p1}, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->toRadioResponseInfo(Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;)Landroid/hardware/radio/V1_0/RadioResponseInfo;

    move-result-object v0

    .line 99
    .local v0, "responseInfo":Landroid/hardware/radio/V1_0/RadioResponseInfo;
    const-string v1, "QtiRadioResponse"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Lvendor/qti/hardware/radio/qtiradio/V1_0/QtiRadioResponseInfo;->serial:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] <  RIL_REQUEST_CDMA_SEND_SMS "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    invoke-direct {p0, v0, p2}, Lcom/qualcomm/qti/internal/telephony/QtiRadioResponse;->responseSms(Landroid/hardware/radio/V1_0/RadioResponseInfo;Landroid/hardware/radio/V1_0/SendSmsResult;)V

    .line 101
    return-void
.end method
