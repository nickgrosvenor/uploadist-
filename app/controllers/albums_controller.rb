class AlbumsController < ApplicationController
  
  # @http_method XHR POST
  # @url /documents
  def create
      @album = current_user.albums.create(album_params)
   
  end

private

  def album_params
        params.require(:album).permit(:direct_upload_url)
    end
end
