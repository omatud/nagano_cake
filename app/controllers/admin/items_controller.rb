class Admin::ItemsController < ApplicationController

  def new
     @item = Item.new
     @genres=Genre.all


  end

  def update
    @item =Item.find(params[:id])
    redirect_to admin_item_path


  end

  def edit
     @item =Item.find(params[:id])
     @genres=Genre.all

  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path


  end

  def index
    @items = Item.all


  end

  def show
    @item=Item.find(params[:id])



  end

  private

  def item_params

    params.require(:item).permit(:genre_id, :price, :name, :introduction,:is_active)
  end


end
