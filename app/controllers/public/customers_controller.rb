class Public::CustomersController < ApplicationController

  def show


  end

  def edit
    @customer = current_customer

  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)

  end

  def unsubscribe
    @customer = current_customer


  end

  def destroy
    @customer =Customer.find(params[:id])
    customer.destroy
    redirect_to root_path


  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :telephone_number)


  end


end
