class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
		@members = @team.users
	end

	def new
		@team = Team.new
	end

	def create
		@user = current_user
		@team = Team.new(team_params)
		@team.team_memberships.build(:user_id => @user.id, :captain => true)
		if @team.save
			redirect_to teams_path
		else flash.now[:alert] = @team.errors.full_messages.to_sentence
		render "new"
		end
	end

	def join
		@team = Team.find(params[:id])
		@members = @team.users
		membership = @team.team_memberships.new(:user => current_user)
		if membership.save
			redirect_to team_path(@team)
		else
			flash.now[:alert] = membership.errors.full_messages.to_sentence
		render "show"
		end
	end

	def leave
		@team = Team.find(params[:id])
		@members = @team.users
		membership = @team.team_memberships.find_by(:user => current_user)
		if membership.destroy
			redirect_to team_path(@team)
		else
			flash.now[:alert] = membership.errors.full_messages.to_sentence
		render "show"
		end
	end

	def lead
		@team = Team.find(params[:id])
		@members = @team.users
		membership = @team.team_memberships.find_by(:user => current_user)
		membership.captain = true
		if membership.save
			redirect_to team_path(@team)
		else
			flash.now[:alert] = membership.errors.full_messages.to_sentence
		render "show"
		end
	end

private

	def team_params
		params.require(:team).permit(:name)
	end

end
