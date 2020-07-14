class Inventory < ApplicationRecord 
    belongs_to :vehicle
    # scope :price, -> {where("price > 15000")}
    # ^^ original scope I want to use but decided to make custom class methods instead.

    def self.economical_vehicles
        economical_vehicles = []
        all.each do |vehicle|
            if vehicle.price.to_i.between?(1000, 25000)
                economical_vehicles << vehicle
            end
        end
        economical_vehicles
    end

    def self.luxury_vehicles
        luxury_vehicles = []
        all.each do |vehicle|
            if vehicle.price.to_i.between?(25000, 65000)
                luxury_vehicles << vehicle
            end
        end
        luxury_vehicles
    end
    
    def self.exotic_vehicles
        exotic_vehicles = []
        all.each do |vehicle|
            if vehicle.price.to_i.between?(65000, 150000)
                exotic_vehicles << vehicle
            end
        end
        exotic_vehicles
    end 
end