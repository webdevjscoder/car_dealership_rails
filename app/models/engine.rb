class Engine < ApplicationRecord
    has_many :vehicles
    validates :horsepower, presence: true, allow_blank: false
    validates :torque, presence: true, allow_blank: false

    def engine_select
        "#{horsepower}hp | #{torque}ft-lbs"
    end
end