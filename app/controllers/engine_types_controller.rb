class EngineTypesController < ApplicationController

    def new
        @engine_type = EngineType.new
    end

    def create
        @engine_type = EngineType.new(engine_type_params(:name, :drive_line_id, :transmission_type_id))
    end

    private

    def engine_type_params(*args)
        params.require(:engine_type).permit(*args)
    end
end