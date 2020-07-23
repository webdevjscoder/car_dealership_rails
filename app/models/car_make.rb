class CarMake < ApplicationRecord
    has_many :vehicles
    validates :name, presence: true, allow_blank: false
    validates :name, uniqueness: true
end
