class ApplicationController < ActionController::Base
	before_action :set_search

	def set_search
		@search = Post.ransack(params[:q])
		@search_posts = @search.result.order(created_at: :desc).includes(:user)
	end

	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
