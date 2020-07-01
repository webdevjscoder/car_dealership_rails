class Inventory < ApplicationRecord 
    belongs_to :vehicle

    def create_inventory
        Vehicle.all.each do |vehicle|
            Inventory.create(vehicle_id: vehicle.id, )
        end
    end
end