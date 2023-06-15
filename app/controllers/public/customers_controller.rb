class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:top,:about]

  def show
    @customer = current_customer

  end

  def edit
    @customer = current_customer

  end

  def update
    @customer = current_customer
    
    if @customer.update(customer_params)
       redirect_to customers_path(@customer.id)
    else
       render :edit
    end     

  end

  def unsubscribe
    @customer = current_customer



  end

  def withdraw

    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path


  end



  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :telephone_number)


  end


end
