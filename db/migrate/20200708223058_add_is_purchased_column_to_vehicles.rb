class AddIsPurchasedColumnToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :is_purchased, :boolean, default: false
  end
end
