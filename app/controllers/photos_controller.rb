class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  
  
  def create
    if current_user
      a = Album.find(params[:album_id])
      p = Photo.new(photo_params)
      p.rating_amount = 0
      p.save
      a.album_photos.create(photo:p)
    end

    redirect_to a

    # respond_to do |format|
    #   if @photo.save
    #     format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @photo }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @photo.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # def addvote 
  #   @photo = Photo.find(params[:id])
  #   @ratings = @photo.ratings.count += 1
  #   redirect_to :back

  # end 

  #  def downvote 
  #   @photo = Photo.find(params[:id])
  #   @ratings = @photo.ratings.count -= 1
  #   redirect_to :back
  # end 

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:direct_upload_url, :user_id)
    end
end
