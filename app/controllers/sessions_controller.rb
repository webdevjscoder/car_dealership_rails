class SessionsController < ApplicationController

    def new
        @customer = Customer.new
    end

    def create
        customer = Customer.find_by(email: params[:customer][:email])
        session[:user_id] = customer.id
        redirect_to welcome_path(customer)
    end

    def destroy
        session.delete :id
        redirect_to root_path
    end
end