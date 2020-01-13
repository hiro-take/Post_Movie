class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @movies = Movie.new
  end


  def create
    @movies = Movie.new(movie_params)
    if @movies.save
      redirect_to root_path, notice: '投稿されました'
    else
      flash.now[:alert] = '全て入力してください'
      render :new 
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
    @comments = @movie.comments.includes(:user)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to movie_path(movie.id)
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to root_path
  end


  def search
    @movies = Movie.search(params[:keyword]).page(params[:page]).per(10)
  end


  private
  def movie_params
    params.require(:movie).permit(:title, :description, :video, :image).merge(user_id: current_user.id)
  end

  
end
