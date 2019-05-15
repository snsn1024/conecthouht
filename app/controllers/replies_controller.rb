class RepliesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		reply = current_user.replies.new(reply_params)
		reply.post_id = post.id
		reply.save
		redirect_to post_path(post.id)
	end

	private
	def reply_params
		params.require(:reply).permit(:user_id, :post_id, :reply_title, :reply_text, :reply_image, :reply_sound)
	end

end
