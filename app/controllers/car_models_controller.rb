class CarModelsController < ApplicationController

    def new
        @car_model = CarModel.new
    end

    def create
        @car_model = CarModel.new(car_model_params(:make_name))
    end

    private

    def car_model_params(*args)
        params.require(:car_model).permit(*args)
    end

end
