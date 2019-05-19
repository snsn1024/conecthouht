class ApplicationController < ActionController::Base
	before_action :set_search

	def set_search
		@search = Post.ransack(params[:post_title])
		@results = @search.result
	end
end
