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

    def edit
        @user = User.find_by_id( params[:user][:id])
    end

    def update
        if params[:user]
            user = User.find_by_id(params[:id])
            user.update(user_params(:first_name, :last_name, :email, :phone, :password, :password_confirmation))
            user.save
            redirect_to user_path(user)
        elsif !params[:user][:password] == '' && !params[:user][:password_confirmation] == ''
            user = User.find_by_id(params[:id])
            user.update(user_params(:first_name, :last_name, :email, :phone, :password, :password_confirmation))
            user.save
            redirect_to user_path(user)
        else
            flash[:notice] = 'New password or password confirmation field was empty.'
            redirect_to user_path(current_user)
        end
    end

    def change_password
        @user = User.find_by_id(params[:id])
    end

    def favorites
        if !current_user.vehicles.present?
            flash[:notice] = "You currently don't have any favorites. :("
            render :show
        else
            @user_vehicles = current_user.vehicles
        end
    end

    def purchases
        if !current_user.vehicles.present?
            flash[:notice] = "You currently don't have any purchased cars. :("
            render :show
        else
            @purchases = current_user.vehicles
        end
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
