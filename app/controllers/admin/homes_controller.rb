class Admin::HomesController < ApplicationController


def top
    @order_histories = OrderHistory.all.page(params[:page]).per(10)
    @order_history_details = OrderHistoryDetail.all

end


end
