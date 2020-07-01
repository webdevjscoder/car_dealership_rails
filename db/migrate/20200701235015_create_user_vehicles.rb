class CreateUserVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
