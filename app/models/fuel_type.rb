class FuelType < ApplicationRecord
    has_many :vehicles

    def selection_name 
        "#{name} - City #{city_mpg} mpg | Hwy #{hwy_mpg} mpg"
    end
end