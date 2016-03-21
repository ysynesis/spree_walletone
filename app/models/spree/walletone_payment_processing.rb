class Spree::WalletonePaymentProcessing

  attr_reader :payment_id, :order_id, :payer_id, :payment_method_id, :amount

  def initialize(options)
    @payment_id = options[:payment_id]
    @order_id = options[:order_id]
    @payer_id = options[:payer_id]
    @payment_method_id = options[:payment_method_id]
    @amount = options[:amount]
  end

  def process
    order.payments.create!({
      source: Spree::WalletoneCheckout.create({
        token: payment_id,
        payer_id: payer_id
      }),
      amount: amount,
      payment_method: payment_method
    })
    order.next
  end

  def order
    @order ||= Spree::Order.find_by_number(order_id)
  end

  def payment_method
    Spree::PaymentMethod.find(payment_method_id)
  end

end
