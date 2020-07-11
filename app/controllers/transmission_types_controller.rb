class TransmissionTypesController < ApplicationController

    def new
        @transmission_type = TransmissionType.new
    end

    def create
        @transmission_type = TransmissionType.new(transmission_type_params(:name))
    end

    private

    def transmission_type_params(*args)
        params.require(:transmission_type).permit(*args)
    end
end