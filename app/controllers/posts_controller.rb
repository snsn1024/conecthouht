class PostsController < ApplicationController

	def index
		@post = Post.new
		@posts = Post.all
	end
	
	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		# post.gunre_id = 
		post.save
		redirect_to post_path(post.id)
	end

	def show
		@post = Post.find(params[:id]) 
	end

	private

	def post_params
		params.require(:post).permit(:post_title,:post_text,:post_image,:post_sound)
	end

end
