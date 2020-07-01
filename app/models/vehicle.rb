class Vehicle < ApplicationRecord
    belongs_to :car_make
    belongs_to :car_model
    belongs_to :engine_type
    belongs_to :fuel_type
    belongs_to :transmission
    belongs_to :engine
    has_many :inventories
    has_many :user_vehicles
    has_many :users, through: :user_vehicles
end
