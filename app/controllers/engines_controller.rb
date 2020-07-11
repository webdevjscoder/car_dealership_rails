class EnginesController < ApplicationController

    def new
        @engine = Engine.new
    end

    def create
        @engine = Engine.new(engine_params(:horsepower, :torque))
    end

    private

    def engine_params(*args)
        params.require(:engine).permit(*args)
    end
end