class AddVehicleRefToInventories < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :vehicle, null: false, foreign_key: true
  end
end
