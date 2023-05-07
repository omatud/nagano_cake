class OrderHistoryDetail < ApplicationRecord

belongs_to :item
belongs_to :order_history

  def subtotal
    tax_included_price * quantity
  end

end
