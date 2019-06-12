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
		if post.save
			flash[:notice] = "投稿しました!"
			redirect_to post_path(post.id)
		else
			flash[:notice] = "Error!"
			render :index
		end
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
		if @post.update(post_params)
			flash[:notice] = "更新しました!"
			redirect_to post_path(@post)
		else
			flash[:notice] = "Error!"
			render :show
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "消去しました!"
			redirect_to posts_path
		else
			flash[:notice] = "Error!"
			render :show
		end
	end

	private

	def post_params
		params.require(:post).permit(:post_title,:post_text,:post_image,:post_sound,:tag_list)
	end
end
