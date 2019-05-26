class PostsController < ApplicationController
	before_action :authenticate_user! 
	before_action :current_user,only:[:edit,:update,:destroy]

	def index
		@post = Post.new
		@posts = Post.all.order(created_at: :desc)
	end
	
	def create
		post = Post.new(post_params)
		post.user_id = current_user.id
		post.save
		redirect_to post_path(post.id)
	end

	def show
		@post = Post.find(params[:id]) 
		@comment = Comment.new
		@reply = Reply.new
		@replies = @post.replies.order(created_at: :desc)
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
		params.require(:post).permit(:post_title,:post_text,:post_image,:post_sound,:tag_list)
	end
end
