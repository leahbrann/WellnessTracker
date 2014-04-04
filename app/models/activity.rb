class Activity < ActiveRecord::Base
	belongs_to :category
	has_many :activity_records
	validates :category_id, presence: true
end
