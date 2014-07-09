class PagesController < ApplicationController

	def leaderboard
		@users = User.joins(:activity_logs).uniq
		@teams = Team.all
		@scoreshash = Hash[@users.map{|user| [user.username, user.score]}]
		@teamscores = Hash[@teams.map{|team| [team.name, team.score]}] 
	end

	def index
		@user = current_user
	end
end


