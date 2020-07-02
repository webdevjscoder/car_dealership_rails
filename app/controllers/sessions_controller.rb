class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        session[:user_id] = user.id
        redirect_to welcome_path(user), notice: 'You were successfully signed in!'
    end

    def destroy
        session.delete :user_id
        redirect_to root_path, notice: 'You were successfully logged out!'
    end
end