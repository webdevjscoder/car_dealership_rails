class VehiclesController < ApplicationController
    before_action :initialize_new_vehicle, only: [:new]

    def index
        @vehicles = Vehicle.paginate(page: params[:page], per_page: 5)
    end

    def new
        @vehicle = Vehicle.new
        @vehicle.inventories.new
    end

    def upload_image
    end

    def add_image
        image = Vehicle.save(params[:upload], params[:id])
        @vehicle = Vehicle.last
        byebug
        redirect_to vehicle_path(@vehicle)
    end

    def create
        # params[:vehicle][:inventories_attributes]['0'][:price].to_i
        vehicle = Vehicle.new(vehicle_params(:car_make_id, :car_model_id, :year, :engine_type_id, :fuel_type_id, :transmission_id, :engine_id, inventories_attributes: [:id, :price]))
        byebug
        if vehicle.save
            redirect_to upload_image_path(vehicle)
        else
            render :new
        end
    end

    def edit
        @vehicle = Vehicle.find_by_id(params[:vehicle][:id])
    end

    def update
        byebug
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

    private

    def vehicle_params(*args)
        params.require(:vehicle).permit(*args)
    end

    def initialize_new_vehicle
        @vehicle = Vehicle.new
    end
end
