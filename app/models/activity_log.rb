class ActivityLog < ActiveRecord::Base
	belongs_to :user
	has_many :activity_records
	has_many :activities, through: :activity_records
	accepts_nested_attributes_for :activity_records

	def points
		self.activity_records.collect {|x| x.activity.points}.reduce(:+)
	end

end
