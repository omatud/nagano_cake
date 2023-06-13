class Admin::OrderHistoriesController < ApplicationController

  def update

  end


  def show
    @order_history = OrderHistory.find(params[:id])
    @total = 0
  end

   private

  def order_history_params
    params.require(:order_history).permit(:payment_method, :postal_code, :address, :name, :postage, :total_payment)
  end
end
