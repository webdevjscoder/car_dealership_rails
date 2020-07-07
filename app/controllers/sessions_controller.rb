class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if params[:provider]
            user = User.find_or_create_by(provider: auth_hash[:provider], uid: auth_hash[:uid]) do |user|
                user.name = auth_hash[:info][:name]
                user.password = SecureRandom.hex
            end
            session[:user_id] = user.id
            redirect_to welcome_path(user), notice: 'You were successfully signed in!'
        else
            user = User.find_by(email: params[:user][:email])
            session[:user_id] = user.id
            redirect_to welcome_path(user), notice: 'You were successfully signed in!'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path, notice: 'You were successfully logged out!'
    end

    private
       
    def auth_hash
      request.env['omniauth.auth']
    end
end