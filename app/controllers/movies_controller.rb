class MoviesController < ApplicationController
	def movies_with_filters
    @movies = Movie.with_good_reviews(params[:threshold])
    @movies = @movies.for_kids          if params[:for_kids]
    @movies = @movies.with_many_fans    if params[:with_many_fans]
    @movies = @movies.recently_reviewed if params[:recently_reviewed]
  end

  def index
  	@movies = Movie.order("title ASC")
  end


  def show
  	id = params[:id] # retrieve movie ID from URI route
  	@movie = Movie.find_by_id(id) # look up movie by unique ID
  	if @movie 
	    render :partial => 'movie', :object => @movie and return if request.xhr?
	    # will render app/views/movies/show.<extension> by default
	  else
	  	flash[:notice] = "Um... sorry, that movie could not be found."
	  	redirect_to movies_path
	  end
  end


=begin
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find_by_id(id) # look up movie by unique ID
    render :partial => 'movie', :object => @movie and return if request.xhr?
    # will render app/views/movies/show.<extension> by default
  end
=end


	def new
		@movie = Movie.new
	  # default: render 'new' template
	end

	def create
	  @movie = Movie.new(params[:movie])
	  if @movie.save
	    flash[:notice] = "#{@movie.title} was successfully created."
	    redirect_to movies_path
	  else
	    render 'new' # note, 'new' template can access @movie's field values!
	  end
	end

	def edit
	  @movie = Movie.find params[:id]
	end

	def update
	  @movie = Movie.find params[:id]
	  if @movie.update_attributes(params[:movie])
	    flash[:notice] = "#{@movie.title} was successfully updated."
	    redirect_to movie_path(@movie)
	  else
	    render 'edit' # note, 'edit' template can access @movie's field values!
	  end
	end
	def destroy
	  @movie = Movie.find(params[:id])
	  @movie.destroy
	  flash[:notice] = "Movie '#{@movie.title}' deleted."
	  redirect_to movies_path
	end
end