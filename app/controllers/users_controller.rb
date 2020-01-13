class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movies = @user.movies.order("created_at DESC").page(params[:page]).per(10)
  end
end
