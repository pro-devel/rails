class EpisodesController < ApplicationController
	before_action :find_user
	before_action :find_episode


	def new 
		@episode = @user.episodes.new
	end

	def edit

	end

	def update
		if @episode.update episode_params
			redirect_to user_episode_path(@user, @episode), notice: "Episode updated"
		else
			render 'new'
		end
	end

	def destroy
		@episode.destroy
		redirect_to root_path
	end

	def create 
		@episode = @user.episodes.new episode_params
		if @episode.save
			redirect_to user_episode_path(@user, @episode)
		else
			render 'edit'
		end
	end

	def show
		@episodes = Episode.where(user_id: @user).order("created_at DESC").reject { |e|	e.id == @episode.id }
	end

	private

	def episode_params
		params.require(:episode).permit(:title, :description)
	end

	def find_user
		@user = User.find(params[:user_id])
	end

	def find_episode
		if params[:id].nil?
			@episode = current_episode
		else
			@episode = Episode.find(params[:id])
		end
	end
end
