class CarModelsController < ApplicationController

    def index
        @car_models = CarModel.all
        render :layout => 'forms'
    end

    def new
        @car_model = CarModel.new
        render :layout => 'forms'
    end

    def create
        car_model = CarModel.new(car_model_params(:name))
        if car_model.save
            flash[:notice] = 'Car Model was successfully created!'
            redirect_to new_vehicle_path
        else
            render :new
        end
    end
    
    def edit
        @car_model = CarModel.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        car_model = CarModel.find_by_id(params[:id])
        car_model.update(car_model_params(:name))
        car_model.save
        redirect_to new_vehicle_path
    end

    def destroy
        CarModel.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to new_vehicle_path
    end

    private

    def car_model_params(*args)
        params.require(:car_model).permit(*args)
    end

end
