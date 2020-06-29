class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :vehicle_id
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
