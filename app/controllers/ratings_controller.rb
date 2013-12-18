class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    puts "Well... " + rating_params.inspect
    rating = Rating.find_by(user_id: current_user.id, photo_id: rating_params[:photo_id])

    if rating
      p = Photo.find(rating.photo_id)
      if rating.is_good != (rating_params[:is_good] == "true")
        p.rating_amount += rating.is_good ? -1 : 1
        rating.destroy
        p.save
      end
      render json: {id:p.id, rating:p.rating_amount}
      return
    else
      rating = Rating.new(user_id: current_user.id,
       photo_id: rating_params[:photo_id]) if !rating

      p = Photo.find(rating.photo_id)
      rating.is_good = rating_params[:is_good]
      rating.save
      if rating.is_good
        p.rating_amount += 1
      else
        p.rating_amount -= 1
      end
      p.save
    end
    render json: {id:p.id, rating:p.rating_amount}
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:user_id, :photo_id, :is_good)
    end
end
