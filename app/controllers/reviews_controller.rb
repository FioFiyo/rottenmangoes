class ReviewsController < ApplicationController
  before_filter :restrict_access
  before_filter :load_movie

	def new
	  	@review = @movie.reviews.build
  end

  def create
  	@review = @movie.reviews.build(review_params)
  	@review.user_id = current_user.id

  	if @review.save
  		redirect_to @movie, notice: "Review created succesfully"
  	else
  		render :new
  	end
  end

  def destroy
    @review = Review.find(params[:id])
    movie_id = @review.movie_id
    @review.destroy
   #specify the controller otherwise it'll try to find the same and create an error
    redirect_to :controller=>'movie', :action=>'show', :id=>movie_id

  end
#from #{@user(params[:id]).full_name}
  

  protected

	def load_movie
		@movie = Movie.find(params[:movie_id])
	end

  def review_params
  	params.require(:review).permit(:text, :rating_out_of_ten)
  end

 
end
