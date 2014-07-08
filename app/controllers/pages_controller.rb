class PagesController < ApplicationController

	def scores
		@users = User.joins(:activity_logs).uniq
		@scoreshash = Hash[@users.map{|user| [user.namefirst, user.score]}]
	end

	def index
		@user = current_user
	end
end


