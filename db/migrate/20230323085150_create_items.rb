class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :
      t.integer :
      t.string  :
      t.text    :
      t.boolean :

      t.timestamps
    end
  end
end
