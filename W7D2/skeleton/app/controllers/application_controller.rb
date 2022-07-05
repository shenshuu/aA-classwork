class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged_out?

    def current_user
        @current_user = User.find_by(session_token: session[:session_token])
        @current_user
    end

    def logged_in?
        !!current_user
    end

    def logged_out?
        !logged_in?
    end


end
