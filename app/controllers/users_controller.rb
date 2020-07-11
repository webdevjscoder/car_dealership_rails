class UsersController < ApplicationController
    before_action :initialize_new_user, only: [:new, :create]
    before_action :initialize_new_admin, only: [:new_admin, :create_admin]

    def new
        @user = User.new
    end

    def new_admin
        @admin = User.new
    end

    def create
        @user = User.new(user_params(:first_name, :last_name, :email, :password))
        if @user.save
            session[:user_id] = @user.id
            redirect_to welcome_path(@user), alert: 'Account was successfully created!'
        else
            render :new
        end
    end

    def create_admin
        byebug
        @admin = User.new(user_params(:first_name, :last_name, :email, :password, :admin))
        @admin.admin = true
        byebug
        if @admin.save
            byebug
            session[:user_id] = @admin.id
            redirect_to welcome_path(@admin), alert: 'Account was successfully created!'
        else
            render :new_admin
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def favorites
        @user_vehicles = current_user.vehicles
    end

    def purchases
        @purchases = current_user.vehicles
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end

    def initialize_new_user
        @user = User.new
    end

    def initialize_new_admin
        @admin = User.new
    end
end
