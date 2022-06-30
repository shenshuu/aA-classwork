class ArtworkSharesController < ApplicationController
    def index
        ArtworkShare.all
    end
    
    def create
        @share = ArtworkShare.new(artwork_share_params)

        if @share.save 
            redirect_to @share
        else
            render json: @share.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def destroy
        @share = ArtworkShare.find(params[:id])
        @share.destroy
    end

    private

    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end