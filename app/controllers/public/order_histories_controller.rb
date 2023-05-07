class Public::OrderHistoriesController < ApplicationController
  
  def new
    @order_history = OrderHistory.new
    
    

  
  
  end
  
  def confirm
    @order_history = OrderHistory.new
    @order_history.customer_id = current_customer.id
    @order_history.postage = 800
    @order_history.status = 0
    
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
    @order_history.save
    redirect_to 


    
  
  
  end
  
  def index
  
  
  end
  
  def show
  
  
  end
  
  def order_history_params
    params.require(:order_history).permit(:payment_method, :postal_code, :address, :name)
  end
  
end
