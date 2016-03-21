module Spree
  class WalletoneController < StoreController

    before_action :set_callback_order, only:[:confirm]

    def confirm
      if @callback_order.complete?
        flash.notice = Spree.t(:order_processed_successfully)
        flash[:order_completed] = true
        session[:order_id] = nil
        redirect_to order_path(@callback_order)
      else
        redirect_to checkout_state_path(@callback_order.state)
      end
    end

    private

    def set_callback_order
      @callback_order = Spree::Order.find_by_number(params[:id])
    end

  end
end
