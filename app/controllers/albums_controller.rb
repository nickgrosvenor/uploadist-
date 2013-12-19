class AlbumsController < ApplicationController

  
  # @http_method XHR POST
  # @url /documents
  def create
  #   if current_user
  # @album = Album.create!(album_params)
  #   end
        if current_user
      @album = current_user.albums.create!(album_params)

      @album.photos.create(direct_upload_url: @album.direct_upload_url, rating_amount: 0)
      redirect_to :back
        else
        redirect_to root_url 
        
  
        end
  end


  def show
  @album = Album.find(params[:id])
  @photo = Photo.new


  end   


private

  def album_params
        params.require(:album).permit(:direct_upload_url, :name)
    end
end
