module Spree
  module WalletoneHelper
    def walletone_payment(options)
        payment = Walletone::Payment.new(
          WMI_MERCHANT_ID:    ENV['WALLETONE_MERCHANT_ID'],
          WMI_PAYMENT_AMOUNT:  options[:amount], # Сумма
          WMI_CURRENCY_ID:     options[:currency_id], # ISO номер валюты (По умолчанию 643 - Рубль),
          WMI_PTENABLED:      options[:ptenabled],
          WMI_PAYMENT_NO: options[:payment_no],
          WMI_SUCCESS_URL: options[:success_url],
          WMI_FAIL_URL: options[:fail_url],
          WMI_DESCRIPTION: options[:description],
          PAYMENT_METHOD_ID: options[:payment_method_id]
        )
        payment.sign! ENV['WALLETONE_SECRET']
        payment
    end

    def walletone_form(options)
      form = walletone_payment(options).form
      form_tag form.checkout_url, form.options do
        concat raw form.hidden_fields_tags
        concat button_tag ''
      end
    end
  end
end
