class Vehicle < ApplicationRecord
    belongs_to :car_make
    belongs_to :car_model
    has_many :inventories
end
