class WelcomeController < ApplicationController

    def home
        @customer = Customer.find_by(id: params[:id])
    end

end