class Public::OrdersController < ApplicationController

    before_action :authenticate_customer!
    before_action :ensure_cart_items, only: [:new, :confirm, :create]
  def new
    @order_history = OrderHistory.new
  end

  def confirm
    @order_history = OrderHistory.new
    @order_history.customer_id = current_customer.id
    @order_history.postage = 800
    @order_history.status = 0
    @total = 0

    @cart_items = current_customer.cart_items.all

    @order_history.payment_method = params[:order_history][:payment_method]


       if params[:order_history][:select_address] == "0"

            @order_history.postal_code = current_customer.postal_code
            @order_history.address = current_customer.address
            @order_history.name = current_customer.last_name + current_customer.first_name


       elsif params[:order_history][:select_address] == "1"
            address = Address.find(params[:order_history][:address_id])
            @order_history.postal_code = address.postal_code
            @order_history.address = address.address
            @order_history.name = address.name

       elsif params[:order_history][:select_address] == "2"
            address = Address.new
            address.customer_id = current_customer.id
            address.postal_code = params[:order_history][:postal_code]
            address.address = params[:order_history][:address]
            address.name = params[:order_history][:name]
            address.save
            @order_history.postal_code = address.postal_code
            @order_history.address = address.address
            @order_history.name = address.name
       end

  end

  def complete

  end

  def create
    @order_history = OrderHistory.new(order_history_params)
    @order_history.customer_id = current_customer.id
    @order_history.total_payment = params[:order_history][:total_payment]
    @order_history.postage = 800
    @order_history.save!

    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|
      order_history_detail = OrderHistoryDetail.new
      order_history_detail.order_history_id = @order_history.id
      order_history_detail.quantity = cart_item.amount
      order_history_detail.tax_included_price = cart_item.item.price*1.1
      order_history_detail.item_id = cart_item.item_id
      order_history_detail.save
    end

    @cart_items.destroy_all

    # @cart_item.item.id = params[:cart_item][:item.id]
    # @cart_item.customer.id = params[:cart_item][:customer.id]
    # @cart_item.amount = params[:cart_item][:amount]
    # @order_history_details.item.id = address.postal_code
    # @order_history_details.postal_code = address.postal_code
    # @order_history_details.postal_code = address.postal_code
    # @order_history_details.save
    redirect_to orders_complete_path





  end

  def index
    @order_histories = current_customer.order_histories.all



  end

  def show
    @order_history = OrderHistory.find(params[:id])
    @total = 0
  end

  private

  def order_history_params
    params.require(:order_history).permit(:payment_method, :postal_code, :address, :name, :postage, :total_payment)
  end

  def ensure_cart_items
    @cart_items = current_customer.cart_items
    redirect_to items_path unless @cart_items.first
  end
end
