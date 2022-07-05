class SessionsController < ApplicationController 
    def new 
        render :new 
    end

    def create 
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user.nil?
            render :new 
        else
            @user.reset_session_token!
            session[:session_token] = @user.session_token
            redirect_to cats_url 
        end
    end

    def destroy
        debugger
        user = current_user
        user.reset_session_token!
        session[:session_token] = nil
        user = nil
        redirect_to :new
    end
end