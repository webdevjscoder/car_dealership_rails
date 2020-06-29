class CustomersController < ApplicationController

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params(:first_name, :last_name, :email, :password))
        @customer.save
        redirect_to welcome_path(@customer)
    end

    private

    def customer_params(*args)
        params.require(:customer).permit(*args)
    end
end
