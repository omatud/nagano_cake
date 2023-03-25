class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.integer :
      t.string  :
      t.string  :
      t.string  :
      t.timestamps
    end
  end
end
