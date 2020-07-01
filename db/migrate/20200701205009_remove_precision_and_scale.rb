class RemovePrecisionAndScale < ActiveRecord::Migration[6.0]
  def change
    change_column :inventories, :price, :decimal, precision: 9, scale: 2
  end

  reversible do |dir|
    dir.up do
      change_column :inventories, :price, :decimal, precision: 9, scale: 2
    end

    dir.down do
      change_column :inventories, :price, :decimal
    end
  end
end
