class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!, except: [:top,:about]

  def new
     @item = Item.new
     @genres=Genre.all


  end

  def update
    @item =Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)


  end

  def edit
     @item =Item.find(params[:id])
     @genres=Genre.all

  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)


  end

  def index
    @items = Item.all.page(params[:page]).per(10)

  end

  def show
    @item=Item.find(params[:id])



  end

  private

  def item_params

    params.require(:item).permit(:genre_id, :price, :name, :introduction,:is_active, :image)
  end


end
