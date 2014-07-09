class TeamMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  validates :user_id, uniqueness: {message: "can only belong to one team"}
end
