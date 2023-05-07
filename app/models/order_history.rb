class OrderHistory < ApplicationRecord
  
  belongs_to :customer
  has_many :order_history_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: { awaiting_payment: 0, payment_confirmation: 1, in_production: 2, dispatch_in_preparation: 3, already_shipped: 4 }

  

  
end
