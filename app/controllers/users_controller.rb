class UsersController < ApplicationController

  def index
  end

  def new
    session[:user_type] = "User"
  end

  def create
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end
end
