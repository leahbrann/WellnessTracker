class ActivityLog < ActiveRecord::Base
	belongs_to :user
	has_many :activity_records, dependent: :destroy
	has_many :activities, through: :activity_records
	accepts_nested_attributes_for :activity_records
	validates :date, presence: :true
	validates :date, uniqueness: { scope: :user_id,
    message: "Only one log per day" }

	def points
		self.activity_records.collect {|x| x.activity.points}.reduce(:+)
	end

end
