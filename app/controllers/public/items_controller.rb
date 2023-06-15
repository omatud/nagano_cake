class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:top,:about]

  before_action :authenticate_customer!

  def index
    @items = Item.all.page(params[:page]).per(8)
    @genres = Genre.all

  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem.new
    @genres = Genre.all



  end



end
