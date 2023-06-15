class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:top,:about]

  def index
  @cart_item = current_customer.cart_items
  @items = Item.all
  @total = 0

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path


  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path



  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path


  end

  def create
    @cart_items = current_customer.cart_items

    if @cart_items.where(item_id: params[:cart_item][:item_id]).present?
       @cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
       @cart_item.update(amount: params[:cart_item][:amount].to_i + @cart_item.amount)
       redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
         redirect_to cart_items_path
      else
         render 'public/items/show'
      end
    end



  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id,:item_id, :amount)
  end

end
