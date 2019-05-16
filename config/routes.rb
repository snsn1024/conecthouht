Rails.application.routes.draw do
	devise_for :users
	root :to => "root#top"
	resources :gunres
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
end
