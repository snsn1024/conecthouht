Rails.application.routes.draw do
	devise_for :users
	root :to => "root#top"
	resources :gunres
	resources :users
	resources :posts do
		resource :comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
		resource :replys
	end
	resources :relationships, only: [:create, :destroy]
end
