module Admin
  class Admin::MoviesController < ApplicationController
    before_action :require_admin
    def index
      @movies = Movie.all
      render "/admin/movies/index"
    end

    def show
      @movie = Movie.find(params[:id])
      #render "/admin/movies/show"
    end

    def new
      @movie = Movie.new
      render "/admin/movies/new"
    end

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to admin_movies_path, notice: "Movie created successfully!"
      else
        render :new
      end
    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def update
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to admin_movies_path, notice: "Movie updated successfully!"
      else
        render :edit
      end
    end

    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      redirect_to admin_movies_path, notice: "Movie deleted successfully!"
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :genre, :duration, :language, :rating, :release_date)
    end
  end
end