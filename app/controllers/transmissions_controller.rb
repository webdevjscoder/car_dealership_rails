class TransmissionsController < ApplicationController

    def index
        @transmissions = Transmission.all
        render :layout => 'forms'
    end

    def new
        @transmission = Transmission.new
        render :layout => 'forms'
    end

    def create
        @transmission = Transmission.new(transmission_params(:name))
        if @transmission.save
            flash[:notice] = 'Transmission was successfully created!'
            redirect_to new_vehicle_path
        else
            render :new
        end
    end

    def edit
        @transmission = Transmission.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        transmission = Transmission.find_by_id(params[:id])
        transmission.update(transmission_params(:name))
        transmission.save
        redirect_to new_vehicle_path
    end

    def destroy
        Transmission.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to new_vehicle_path
    end

    private

    def transmission_params(*args)
        params.require(:transmission).permit(*args)
    end

end