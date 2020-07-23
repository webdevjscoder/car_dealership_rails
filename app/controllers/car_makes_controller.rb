class CarMakesController < ApplicationController
    before_action :new_make, only: [:new, :create]

    def index
        @car_makes = CarMake.all
        render :layout => 'forms'
    end

    def new
        render :layout => 'forms'
    end

    def create
        @car_make = CarMake.new(car_make_params(:name))
        if @car_make.save
            flash[:notice] = 'Car Make was successfully created!'
            redirect_to new_vehicle_path
        else
            render :new            
        end
    end

    def edit
        @car_make = CarMake.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        car_make = CarMake.find_by_id(params[:id])
        car_make.update(car_make_params(:name))
        car_make.save
        redirect_to new_vehicle_path
    end

    def destroy
        CarMake.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to new_vehicle_path
    end

    def search
        car_make = CarMake.where(name: "#{params[:name]}")[0]
        redirect_to found_vehicles_path(car_make)
    end

    def found_vehicles
        @vehicles = Vehicle.where("car_make_id = #{params[:id]}")
        @searched_vehicles = @vehicles.paginate(page: params[:page], per_page: 5)
    end

    private

    def car_make_params(*args)
        params.require(:car_make).permit(*args)
    end

    def new_make
        @car_make = CarMake.new
    end
end
