class UsersController < ApplicationController
    def index
        render json: User.all 
    end

    def show 
        render json: params

    end

    def create
        user = User.new(new_params)
        if user.save 
            render json: user 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private 
    def new_params 
        params.require(:user).permit(:name, :email)
    end 
end