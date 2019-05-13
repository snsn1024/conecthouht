Rails.application.routes.draw do
	devise_for :users
	root :to => "root#top"
	resource :gunres
	resources :users do
		resources :posts do
			resource :comments, only: [:create, :destroy]
			resource :favorites, only: [:create, :destroy]
			resource :replys
		end
	end
end
