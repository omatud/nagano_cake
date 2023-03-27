class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|

      t.integer :customer_id,null: false, default: ""
      t.integer :total_payment
      t.integer :postage
      t.integer :
      t.integer :
      t.string  :name,null: false, default: ""
      t.string  :postal_code,null: false, default: ""
      t.string  :address,null: false, default: ""


      t.timestamps null: false
    end
  end
end
