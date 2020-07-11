class AddQuantityColumnToInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :quantity, :integer
  end
end
