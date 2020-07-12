class Engine < ApplicationRecord
    has_many :vehicles

    def engine_select
        "#{horsepower}hp | #{torque}ft-lbs"
    end
end