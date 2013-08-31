Rotpot::Application.routes.draw do
	get  'auth/:provider/callback' => 'sessions#create',:as => 'login'
	post 'logout' => 'sessions#destroy'
	get  'auth/failure' => 'sessions#failure'

  resources :movies
  root :to => redirect('/movies')
end