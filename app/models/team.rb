class Team < ActiveRecord::Base
	has_many :team_memberships, dependent: :destroy
	has_many :users, through: :team_memberships
	validates_associated :team_memberships

	def score
		self.users.collect{|u| u.score}.reduce(:+) || 0
	end

	def captain
		captaincy = (self.team_memberships.find_by :captain => true)
		if captaincy.nil?
			"None" 
		else captaincy.user.username
		end
	end
end
