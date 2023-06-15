class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!, except: [:top,:about]


  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)



  end

  def edit
    @customer = Customer.find(params[:id])

  end


  def index
    @customers = Customer.all.page(params[:page]).per(10)


  end

  def show
    @customer = Customer.find(params[:id])


  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :telephone_number,:is_deleted)


  end


end
