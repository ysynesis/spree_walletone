module Spree
  class WalletoneCheckout < ActiveRecord::Base
    def purchase(*args)
      OpenStruct.new(success?:true)
    end
  end
end
