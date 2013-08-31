Rotpot::Application.routes.draw do
	get  'auth/twitter/callback' => 'sessions#create',:as => 'login'
	post 'logout' => 'sessions#destroy'
	get  'auth/failure' => 'sessions#failure'

  resources :movies
  root :to => redirect('/movies')
end