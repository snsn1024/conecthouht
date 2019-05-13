Rails.application.routes.draw do
	devise_for :users
	root :to => "root#top"
	resources :users
	resources :posts
end
