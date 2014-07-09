class TeamsController < ApplicationController
	def index
		@teams = Team.all
	end

	def show
		@team = Team.find(params[:id])
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

private

	def team_params
		params.require(:team).permit(:name)
	end

end
