class TransmissionsController < ApplicationController

    def new
        @transmission = Transmission.new
    end

    def create
        @transmission = Transmission.new(transmission_params(:name))
    end

    private

    def transmission_params(*args)
        params.require(:transmission).permit(*args)
    end

end