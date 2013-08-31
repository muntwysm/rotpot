class MoviesController < ApplicationController
  def index
  	@movies = Movie.order("title ASC")
  end

  def show
  	id = params[:id] # retrieve movie ID from URI route
  	@movie = Movie.find_by_id(id) # look up movie by unique ID
  	if @movie 
  		respond_to do |client_wants|
		    client_wants.html {  render "show" } # as before
		    client_wants.xml  {  render :xml => @movie.to_xml    }
	  	end
	  else
	  	flash[:notice] = "Um... sorry, that movie could not be found."
	  	redirect_to movies_path
	  end
  end

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