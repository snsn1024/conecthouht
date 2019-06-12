class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :following, :followers]
	before_action :current_user,only:[:edit,:update,:destroy]

	
	def index
		@users = User.all.order(created_at: :desc)
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@favorites = @user.favorites
		@following = @user.following
		@followers = @user.followers
		@replies = @user.replies
	end

	def create
		@user = User.new(user.params) 
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "ユーザー情報を更新しました!"
			redirect_to user_path(current_user.id)
		else
			flash[:notice] = "Error!"
			render :show
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:profile,:user_image)
	end
end
