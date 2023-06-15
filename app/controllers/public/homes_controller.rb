class Public::HomesController < ApplicationController
  
  def top
    @items = Item.all
    @items_last4 = Item.last(4)

  
  end
  
  def about
  
  end
  
end
