class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.integer :make_id
      t.integer :car_model_id
      t.integer :year, limit: 2
      t.string :engine_driveline
      t.string :engine_type
      t.string :engine_transmission
      t.string :engine_horsepower
      t.string :engine_torque
      t.string :fuel_type
      t.string :city_mpg
      t.string :highway_mpg
      t.string :classification

      t.timestamps
    end
  end
end
