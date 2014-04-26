class ActivityRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity
  validates :activity_log_id, presence: true
  validates :activity_id, presence: true
end
