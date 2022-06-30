class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            redirect_to @comment
        else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end
    
    def index
        @user = User.find(params[:user_id])
        render json: @user.comments
    end

    private

    def comments_params
        params.require(:comments).permit(:user_id, :artwork_id, :body)
    end
    
end