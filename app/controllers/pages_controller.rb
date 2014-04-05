class PagesController < ApplicationController

	def scores
		@users = User.all
		@scoreshash = Hash[@users.map{|user| [user.namefirst, user.score]}]
	end
end


