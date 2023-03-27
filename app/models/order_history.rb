class OrderHistory < ApplicationRecord
  
  belongs_to :customer
  belongs_to :order_history_detail
  
end
