class UserVehiclesController < ApplicationController
    before_action :authorized_user

    def create
        existing_record = UserVehicle.find_or_initialize_by(vehicle_id: params[:vehicle][:id], user_id: current_user.id)
        if existing_record.id.present
            flash[:notice] = 'This already exists in your Favorites.'
            redirect_to vehicle_path(params[:vehicle][:id])
        else
            existing_record.save
            redirect_to favorites_path, alert: 'Vehicle was successfully added to your Favorites!'     
        end
    end

    def checkout
        @vehicle = Vehicle.find_by_id(params[:vehicle][:id])
        redirect_to confirmation_path(@vehicle)
    end

    def confirmation
        @vehicle = Vehicle.find_by_id(params[:id])
        redirect_to root_path
    end
end