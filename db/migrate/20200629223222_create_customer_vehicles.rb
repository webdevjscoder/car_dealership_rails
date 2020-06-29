class CreateCustomerVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_vehicles do |t|
      t.integer :customer_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
