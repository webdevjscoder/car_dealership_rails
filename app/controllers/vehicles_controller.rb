class VehiclesController < ApplicationController

    def index
        @vehicles = Vehicle.paginate(page: params[:page], per_page: 5)
    end

    def show
        @vehicle = Vehicle.find_by_id(params[:id])
    end

    def economical
        @economical = Inventory.economical_vehicles.paginate(page: params[:page], per_page: 5)
    end

    def luxury
        @luxury = Inventory.luxury_vehicles.paginate(page: params[:page], per_page: 5)
    end

    def exotic
        @exotic = Inventory.exotic_vehicles.paginate(page: params[:page], per_page: 5)
    end

    def purchase
        @purchased_vehicle = UserVehicle.find_or_initialize_by(vehicle_id: params[:vehicle][:id], user_id: current_user.id)
        if @purchased_vehicle.id.present?
            @purchased_vehicle.vehicle.update(is_purchased: true)
            @purchased_vehicle.save
            redirect_to root_path(current_user), alert: "Congratulations! You are now the proud owner of the #{@purchased_vehicle.vehicle.year} " "#{@purchased_vehicle.vehicle.car_make.name} " "#{@purchased_vehicle.vehicle.car_model.name}."
        else
            @purchased_vehicle.vehicle.update(is_purchased: true)
            @purchased_vehicle.save
            redirect_to root_path(current_user), alert: "Congratulations! You are now the proud owner of the #{@purchased_vehicle.vehicle.year} " "#{@purchased_vehicle.vehicle.car_make.name} " "#{@purchased_vehicle.vehicle.car_model.name}."
        end
    end
end
