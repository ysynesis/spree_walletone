module Spree
  class Gateway::WalletoneBase < Gateway
    preference :currency_id, :integer
    preference :ptenabled, :string

    def supports?(source)
      true
    end

    def provider_class
      Spree::WalletonePaymentProcessing
    end

    def provider
      Spree::WalletoneCheckout.new()
    end

    def ptenabled
      preferences[:ptenabled] ? preferences[:ptenabled].split(",").map(&:strip) : []
    end

    def method_type
      'walletone_base'
    end

  end
end

#   payment.state = 'completed'
#   current_order.state = 'complete'
