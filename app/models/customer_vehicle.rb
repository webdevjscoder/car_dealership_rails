class CustomerVehicle < ApplicationRecord
    belongs_to :customer
    belongs_to :vehicle
end
