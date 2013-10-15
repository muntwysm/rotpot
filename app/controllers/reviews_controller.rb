class ReviewsController < ApplicationController
  before_filter :has_moviegoer_and_movie, :only => [:new, :create]
  before_filter :correct_user, :only => [:edit, :update]

  protected
  def has_moviegoer_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find_by_id(params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end

  def correct_user
    @review = Review.find(params[:id])
    redirect_to root_url unless @current_user.uid == @review.moviegoer.uid
  end

  public
  def new
    @review = @movie.reviews.build
  end
  def create
    # since moviegoer_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.
    @current_user.reviews << @movie.reviews.build(params[:review])
    redirect_to movie_path(@movie)
  end
	def edit
	  @movie = Movie.find params[:movie_id]
	  @review = @current_user.reviews.find params[:id]
	end

	def update
		@review = @current_user.reviews.find params[:id]
	  if @review.update_attributes(params[:review])
	    flash[:notice] = "The review was successfully updated."
	    redirect_to movie_path(@review.movie_id)
	  else
	    render 'edit' # note, 'edit' template can access @reviews field values!
	  end
	end
	def destroy
	  @movie = Movie.find(params[:movie_id])
	  @review = @current_user.reviews.find params[:id]
	  @review.destroy
	  flash[:notice] = "Review deleted."
	  redirect_to movie_path(@movie)
	end
end