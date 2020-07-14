class EnginesController < ApplicationController

    def index
        @engines = Engine.all
        render :layout => 'forms'
    end

    def new
        @engine = Engine.new
        render :layout => 'forms'
    end

    def create
        engine = Engine.new(engine_params(:horsepower, :torque))
        if engine.save
            flash[:notice] = 'Engine was successfully created!'
            redirect_to new_vehicle_path
        else
            render :new
        end
    end

    def edit
        @engine = Engine.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        engine = Engine.find_by_id(params[:id])
        engine.update(engine_params(:horsepower, :torque))
        engine.save
        redirect_to new_vehicle_path
    end

    def destroy
        Engine.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to new_vehicle_path
    end

    private

    def engine_params(*args)
        params.require(:engine).permit(*args)
    end
end