class Public::CartItemsController < ApplicationController

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
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy_all
    redirect_to cart_items_path


  end

  def create

    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path



  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:customer_id,:item_id, :amount)
  end

end
