class UsersController < ApplicationController

  def index
    @album = Album.new
    @all_albums = Album.all
  end

  def new
    session[:user_type] = "User"
  end

  def home
    @album = Album.new
    @all_albums = Album.find_by_sql("SELECT a.id, a.name, SUM(p.rating_amount) AS \"rating\" FROM albums a LEFT OUTER JOIN album_photos ap ON a.id = ap.album_id LEFT OUTER JOIN photos p ON ap.photo_id = p.id GROUP BY a.id, a.name ORDER BY SUM(p.rating_amount) DESC")
  end

  def create
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end
end
