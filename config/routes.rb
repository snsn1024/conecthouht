Rails.application.routes.draw do
	devise_for :users
	root :to => "root#top"
	get '/top' => 'root#top', as: 'top'
	get '/about' => 'root#about', as: 'about'
	get '/home' => 'root#home', as: 'home'
	resources :users do
		member do
			get :following, :followers
		end
	end
	resources :posts do
		resource :comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
		resource :replies
	end
	resources :relationships, only: [:create, :destroy]
	get 'tags/:tag', to: 'posts#index', as: :tag
end
