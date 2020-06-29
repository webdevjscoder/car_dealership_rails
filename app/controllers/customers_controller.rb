class CustomersController < ApplicationController

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params(:first_name, :last_name, :email, :password))
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to welcome_path(@customer)
        else
            render :new
        end
    end

    private

    def customer_params(*args)
        params.require(:customer).permit(*args)
    end
end
