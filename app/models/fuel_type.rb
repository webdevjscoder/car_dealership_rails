class FuelType < ApplicationRecord
    has_many :vehicles
    validates :name, presence: true, allow_blank: false
    validates :name, uniqueness: true
    validates :city_mpg, presence: true
    validates :hwy_mpg, presence: true

    def selection_name 
        "#{name} - City #{city_mpg} mpg | Hwy #{hwy_mpg} mpg"
    end
end