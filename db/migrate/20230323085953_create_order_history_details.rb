class CreateOrderHistoryDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_history_details do |t|

      t.integer :order_history_idnull, false, default: ""
      t.integer :quantity,null: false, default: ""
      t.integer :tax_included_price,null: false, default: ""
      t.integer :item_id,null: false, default: ""
      t.integer :production_status,null: false, default: 0

      t.timestamps null: false
    end
  end
end
