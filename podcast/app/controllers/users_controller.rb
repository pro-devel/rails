class UsersController < ApplicationController
	def index
		@users = User.all.order("created_at DESC")
	end

	def show
		@user = User.find(params[:id])
		@episode = Episode.find(params[:id])
		@episodes = Episode.where(user_id: @user).order("created_at DESC")
	end
end
