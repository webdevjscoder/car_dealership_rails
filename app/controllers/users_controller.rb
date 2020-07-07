class UsersController < ApplicationController

    def new
        @user = User.new
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

    def show
        @user = User.find_by_id(params[:id])
    end

    def favorites
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end
end
