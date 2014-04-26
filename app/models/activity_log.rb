class ActivityLog < ActiveRecord::Base
	belongs_to :user
	has_many :activity_records
	accepts_nested_attributes_for :activity_records
end
