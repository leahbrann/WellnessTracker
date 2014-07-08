class Team < ActiveRecord::Base
	has_many :team_memberships
	has_many :users, through: :team_memberships

	def score
		self.users.collect{|u| u.score}.reduce(:+) || 0
	end
end
