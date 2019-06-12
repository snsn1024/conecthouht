class RepliesController < ApplicationController
	before_action :current_user,only:[:edit,:update,:destroy]

	def create
		post = Post.find(params[:post_id])
		reply = current_user.replies.new(reply_params)
		reply.post_id = post.id
		if reply.save
			flash[:notice] = "投稿しました!"
			redirect_to post_path(post.id)
		else
			flash[:notice] = "Error!"
			render :show
		end
	end

	def edit
		@reply = Reply.find(params[:id])
	end

	def update
		@reply = Reply.find(params[:id])
		if @reply.update(reply_params)
			flash[:notice] = "更新しました!"
			redirect_to post_path(post.id)
		else
			flash[:notice] = "Error!"
			render :show
		end
	end

	def destroy
		@reply = Reply.find(params[:id])
		if @post.destroy
			flash[:notice] = "消去しました!"
			redirect_to posts_path
		else
			flash[:notice] = "Error!"
			render :show
		end
	end


	private
	def reply_params
		params.require(:reply).permit(:user_id, :post_id, :reply_title, :reply_text, :reply_image, :reply_sound)
	end

end
