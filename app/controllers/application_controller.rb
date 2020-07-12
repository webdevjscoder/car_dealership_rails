class ApplicationController < ActionController::Base
    protect_from_forgery
    helper_method :logged_in?, :current_user, :authorized_user, :admin_user

    protected

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def authorized_user
        if !logged_in?
            redirect_to signin_path
        end
    end

    def admin_user
        if !current_user.admin == true
            redirect_to welcome_path(current_user)
        elsif !logged_in?
            redirect_to signin_path
        end
    end
end
