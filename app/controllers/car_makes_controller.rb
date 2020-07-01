class CarMakesController < ApplicationController

    def new
        @car_make = CarMake.new
    end

    def create
        @car_make = CarMake.new(car_make_params(:make_name))
    end

    private

    def car_make_params(*args)
        params.require(:car_make).permit(*args)
    end
end