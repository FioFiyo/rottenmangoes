class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
  		redirect_to movies_path, notice: "Your movie #{@movie.title} was submitted successfully"
  	else
  		render :new
  	end
  end

  def update
  	@movie = Movie.find(params[:id])

  	if @movie.update_attributes(movie_params)
  		redirect_to movies_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@movie = Movie.find(params[:id])
  	@movie.destroy
  	redirect_to movies_path
  end

  protected

  def movie_params
  	params.require(:movie).permit(:title, :director, :description, :poster_image_url, :runtime_in_minutes, :release_date) 
  end
end
