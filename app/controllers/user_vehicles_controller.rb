class UserVehiclesController < ApplicationController

    def create
        @user_vehicle = UserVehicle.new(vehicle_id: params[:vehicle][:id], user_id: current_user.id)
    end

    def buy_now
        byebug
        @vehicle = Vehicle.find_by_id(params[:vehicle][:id])
    end
end