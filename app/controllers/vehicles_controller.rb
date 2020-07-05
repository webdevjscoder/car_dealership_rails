class VehiclesController < ApplicationController

    def index
        @vehicles = Vehicle.paginate(page: params[:page], per_page: 5)
    end

    def show
        @vehicle = Vehicle.find_by_id(params[:id])
    end
end
