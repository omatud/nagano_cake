class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :addresses
         has_many :cart_items
         has_many :order_histories
         
  def status_text
     if is_deleted == false
        "有効"
     else
        "退会"
     end
  end
end