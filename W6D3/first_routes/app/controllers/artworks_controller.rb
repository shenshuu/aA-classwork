class ArtworksController < ApplicationController
    def index
        # debugger 
        @user = User.find(params[:user_id])
        render json: @user.shared_artworks
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def update
        @artwork = Artwork.find(params[:id])

        if @artwork.update(artwork_params)
            redirect_to @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
        
    end
    
    def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            # debugger 
            redirect_to @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
      
end