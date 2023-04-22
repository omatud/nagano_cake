class CreateOrderHistoryDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_history_details do |t|

      t.integer :order_history_id,null: false
      t.integer :quantity,null: false
      t.integer :tax_included_price,null: false
      t.integer :item_id,null: false
      t.integer :production_status,null: false, default: 0

      t.timestamps null: false
    end
  end
end
