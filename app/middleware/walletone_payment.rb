class WalletonePayment < Walletone::Middleware::Base


  def perform notify, env

    raise 'Wrong sign' unless notify.valid? ENV['WALLETONE_SECRET']

    if notify.accepted?
      Spree::WalletonePaymentProcessing.new(
        payment_method_id: notify['PAYMENT_METHOD_ID'],
        order_id: notify.WMI_PAYMENT_NO,
        payment_id: notify.WMI_ORDER_ID,
        payer_id: notify.WMI_TO_USER_ID,
        amount: notify.WMI_PAYMENT_AMOUNT.to_f
      ).process
    else
      # Payment is failed. Notify your client.
    end
    "Payment processed"
  end


end
