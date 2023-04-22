class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|

      t.integer :customer_id,null: false
      t.integer :total_payment
      t.integer :postage
      t.integer :status,default: 0 
      t.integer :payment_method,default: 0
      t.string  :name,null: false, default: ""
      t.string  :postal_code,null: false, default: ""
      t.string  :address,null: false, default: ""


      t.timestamps null: false
    end
  end
end
