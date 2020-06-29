class Vehicle < ApplicationRecord
    has_many :customer_vehicles
    has_many :customers, through: :customer_vehicles
    belongs_to :make
    belongs_to :car_model
    has_many :inventories
end
