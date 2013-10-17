Rotpot::Application.routes.draw do
	# Omniauth routes
	get  'auth/:provider/callback' => 'sessions#create' # where Twitter will send back to
	get  'logout' => 'sessions#destroy'
	get  'auth/failure' => 'sessions#failure'
	
	# Route that posts 'Search TMDb' form
	post '/movies/search_tmdb'

  resources :movies do
	  resources :reviews
	end
	
	root :to => redirect('/movies')
end