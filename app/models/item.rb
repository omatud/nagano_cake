class Item < ApplicationRecord
  
  has_many   :cart_items
  has_many   :order_history_details
  belongs_to :genre
  
  has_one_attached :image
  
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end
  
  def status_text
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end
  
        
  
end
