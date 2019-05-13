class PostsController < ApplicationController

	def create
		@post = Post.new(post_params)
	end

	def index
		@posts = Post.all
	end

	def show
	end

	private

	def post_params
		params.require(:post).permit(:post_title,:post_text,:post_image,:post_sound)
	end

end
