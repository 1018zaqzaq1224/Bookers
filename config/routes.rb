Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	devise_for :users
	resources :users
	resources :books
	root 'books#home'
	get '/about' => 'books#about'
	resources :user_images, only: [:new, :create, :index, :destroy]


end
