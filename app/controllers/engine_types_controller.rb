class EngineTypesController < ApplicationController

    def index
        @engine_types = EngineType.all
        render :layout => 'forms'
    end

    def new
        @engine_type = EngineType.new
        render :layout => 'forms'
    end

    def create
        engine_type = EngineType.new(engine_type_params(:name, :drive_line_id, :transmission_type_id))
        if engine_type.save
            flash[:notice] = 'Engine type was successfully created!'
            redirect_to new_vehicle_path
        else
            render :new
        end
    end

    def edit
        @engine_type = EngineType.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        engine_type = EngineType.find_by_id(params[:id])
        engine_type.update(engine_type_params(:name, :drive_line_id, :transmission_type_id))
        engine_type.save
        redirect_to new_vehicle_path
    end

    def destroy
        EngineType.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to new_vehicle_path
    end

    private

    def engine_type_params(*args)
        params.require(:engine_type).permit(*args)
    end
end