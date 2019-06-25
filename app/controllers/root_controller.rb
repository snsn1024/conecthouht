class RootController < ApplicationController
	before_action :authenticate_user!, only: [:home]

	def top
	end
	
	def about
	end

	def home
		@posts = Post.all.order(created_at: :desc)
		@users = User.all.order(created_at: :desc)
	end
end
