module ReviewsHelper
	def show_reviews(movie)
	  if movie.reviews.count > 0
	  	render :partial => 'reviews'
	  end
	end
end
