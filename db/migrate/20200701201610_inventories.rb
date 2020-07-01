class Inventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
