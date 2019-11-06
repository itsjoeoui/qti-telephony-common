.class Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;
.super Landroid/telephony/PhoneStateListener;
.source "QtiSubscriptionController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->getPhoneStateListener(II)Landroid/telephony/PhoneStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

.field final synthetic val$pid:I


# direct methods
.method constructor <init>(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;Ljava/lang/Integer;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;
    .param p2, "x0"    # Ljava/lang/Integer;

    .line 636
    iput-object p1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->this$0:Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    iput p3, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->val$pid:I

    invoke-direct {p0, p2}, Landroid/telephony/PhoneStateListener;-><init>(Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 2
    .param p1, "state"    # I
    .param p2, "incomingNumber"    # Ljava/lang/String;

    .line 639
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->this$0:Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->access$000(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)[I

    move-result-object v0

    iget v1, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->val$pid:I

    aput p1, v0, v1

    .line 641
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->this$0:Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->access$100(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->this$0:Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->access$200(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 642
    iget-object v0, p0, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController$1;->this$0:Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;

    invoke-static {v0}, Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;->access$300(Lcom/qualcomm/qti/internal/telephony/QtiSubscriptionController;)V

    .line 644
    :cond_0
    return-void
.end method
