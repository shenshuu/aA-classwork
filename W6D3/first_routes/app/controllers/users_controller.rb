class UsersController < ApplicationController
    def index
     
        users = User.all.pluck(:username)

        if users.include?(params[:username])
            render json: User.find_by(username: params[:username])
        else
            render json: User.all
        end
    end

    def show 
        render json: User.find(params[:id])
    end

    def update 
        # debugger 
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: @user 
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        # debugger 
        @user = User.new(user_params)
        if @user.save
            redirect_to @user 
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy 
        render json: destroy 
    end

    private 
    def user_params 
        params.require(:user).permit(:username)
    end 
end