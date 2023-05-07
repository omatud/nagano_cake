class Admin::OrderHistoriesController < ApplicationController

  def update
    
  end


  def show
    @order_history = OrderHistory.find(params[:id])
  end
end
