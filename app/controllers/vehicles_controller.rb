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
end
