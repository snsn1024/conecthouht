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
		@comment = Comment.new
		@reply = Reply.new
		@replies = @post.replies

	end

	def edit
		@post = Post.find(params[:id]) 
	end

	def update
		@post = Post.find(params[:id]) 
		@post.update(post_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:post_title,:post_text,:post_image,:post_sound)
	end
end
