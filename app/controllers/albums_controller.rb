class AlbumsController < ApplicationController

  
  # @http_method XHR POST
  # @url /documents
  def create
  #   if current_user
  # @album = Album.create!(album_params)
  #   end
  
      @album = current_user.albums.create!(album_params)
      redirect_to :back
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
