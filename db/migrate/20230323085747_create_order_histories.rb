class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|

      t.integer :
      t.integer :
      t.integer :
      t.integer :
      t.integer :
      t.string  :
      t.string  :
      t.string  :


      t.timestamps
    end
  end
end
