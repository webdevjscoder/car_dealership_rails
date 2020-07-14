class VehiclesController < ApplicationController
    before_action :initialize_new_vehicle, only: [:new, :create]
    before_action :find_vehicle, only: [:edit]
    before_action :admin_user, only: [:new, :upload_image, :add_image, :create, :edit, :update]

    def index
        @vehicles = Vehicle.paginate(page: params[:page], per_page: 5)
    end

    def new
        @vehicle.inventories.new
    end

    def upload_image
    end

    def add_image
        image = Vehicle.save(params[:upload], params[:id])
        @vehicle = Vehicle.last
        redirect_to vehicle_path(@vehicle)
    end

    def create
        vehicle = Vehicle.new(vehicle_params(:car_make_id, :car_model_id, :year, :engine_type_id, :fuel_type_id, :transmission_id, :engine_id, inventories_attributes: [:id, :price]))
        if vehicle.save
            redirect_to upload_image_path(vehicle)
        else
            render :new
        end
    end

    def edit
    end

    def update
        vehicle = Vehicle.find_by_id(params[:id])
        if vehicle
            vehicle.update_attributes((vehicle_params(:car_make_id, :car_model_id, :year, :engine_type_id, :fuel_type_id, :transmission_id, :engine_id, inventories_attributes: [:id, :price])))
            vehicle.save
            redirect_to vehicle_path(vehicle)
        else
            render :edit
        end
    end

    def show
        @vehicle = Vehicle.find_by_id(params[:id])
    end

    def destroy
        vehicle = Vehicle.find_by_id(params[:id])
        vehicle.destroy
        redirect_to vehicles_path
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
            redirect_to purchases_path(current_user), alert: "Congratulations! You are now the proud owner of the #{@purchased_vehicle.vehicle.year} " "#{@purchased_vehicle.vehicle.car_make.name} " "#{@purchased_vehicle.vehicle.car_model.name}."
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

    def find_vehicle
        @vehicle = Vehicle.find_by_id(params[:vehicle][:id])
    end
end
