class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        session[:user_id] = user.id
        redirect_to welcome_path(user)
    end

    def destroy
        session.delete :id
        redirect_to root_path
    end
end