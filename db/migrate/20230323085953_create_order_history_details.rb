class CreateOrderHistoryDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_history_details do |t|

      t.integer :
      t.integer :
      t.integer :
      t.integer :
      t.integer :

      t.timestamps
    end
  end
end
