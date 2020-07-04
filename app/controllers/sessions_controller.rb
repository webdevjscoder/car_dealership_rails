class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        # user = User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        # end
       
        # session[:user_id] = user.id
       
        # render root_path
        user = User.find_by(email: params[:user][:email])
        session[:user_id] = user.id
        redirect_to welcome_path(user), notice: 'You were successfully signed in!'
    end

    def destroy
        session.delete :user_id
        redirect_to root_path, notice: 'You were successfully logged out!'
    end

    private
       
    def auth
      request.env['omniauth.auth']
    end
end