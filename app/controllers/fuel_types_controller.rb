class FuelTypesController < ApplicationController

    def index
        @fuel_types = FuelType.all
        render :layout => 'forms'
    end

    def new
        @fuel_types = FuelType.all
        @fuel_type = FuelType.new
        render :layout => 'forms'
    end

    def create
        @fuel_type = FuelType.new(fuel_type_params(:name, :city_mpg, :hwy_mpg))
        if @fuel_type.save
            flash[:notice] = 'Fuel type was successfully created!'
            redirect_to new_vehicle_path
        else
            render :new
        end
    end

    def edit
        @fuel_type = FuelType.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        fuel_type = FuelType.find_by_id(params[:id])
        fuel_type.update(fuel_type_params(:name, :city_mpg, :hwy_mpg))
        fuel_type.save
        redirect_to new_vehicle_path
    end

    def destroy
        FuelType.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to new_vehicle_path
    end

    private

    def fuel_type_params(*args)
        params.require(:fuel_type).permit(*args)
    end
end