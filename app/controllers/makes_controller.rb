class MakesController < ApplicationController

    def new
        @make = Make.new
    end

    def create
        @make = Make.new(make_params(:make_name, :country))
    end

    private

    def make_params(*args)
        params.require(:make).permit(*args)
    end
end
