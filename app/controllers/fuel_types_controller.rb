class FuelTypesController < ApplicationController

    def new
        @fuel_types = FuelType.all
        @fuel_type = FuelType.new
    end

    def create
        @fuel_type = FuelType.new(fuel_type_params(:name, :city_mpg, :hwy_mpg))
    end

    private

    def fuel_type_params(*args)
        params.require(:fuel_type).permit(*args)
    end
end