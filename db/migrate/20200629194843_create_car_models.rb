class CreateCarModels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_models do |t|
      t.string :car_model

      t.timestamps
    end
  end
end
