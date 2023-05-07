class Admin::HomesController < ApplicationController

def top
    @order_histories = OrderHistory.all
    @order_history_details = OrderHistoryDetail.all

end


end
