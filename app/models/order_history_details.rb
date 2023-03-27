class OrderHistoryDetails < ApplicationRecord

belongs_to :item
has_many   :order_histories

end
