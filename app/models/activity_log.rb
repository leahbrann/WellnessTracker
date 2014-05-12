class ActivityLog < ActiveRecord::Base
	belongs_to :user
	has_many :activity_records, dependent: :destroy
	has_many :activities, through: :activity_records
	accepts_nested_attributes_for :activity_records
	validates :date, presence: :true
	validates :date, uniqueness: { scope: :user_id,
    message: "must be unique" }

	def points
		self.activity_records.collect {|x| x.activity.points}.reduce(:+)
	end

	def create_records(activsparams)
		#activity parameters in form of ["", "2", "9", "", "6", "", "8"]. below is a workaround, figure out how to fix form
		actstolog = activsparams.select{|s| s.size > 0}.map{|s| s.to_i}
		actstolog.each {|activity| 
		self.activity_records.new("activity_id" => activity)}
	end

end
