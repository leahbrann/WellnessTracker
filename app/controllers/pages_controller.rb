class PagesController < ApplicationController

	def scores
		@users = User.all
		@scoreshash = Hash[@users.map{|user| [user.namefirst, user.score]}]
	end

	def index
		@user = current_user
	end
end


