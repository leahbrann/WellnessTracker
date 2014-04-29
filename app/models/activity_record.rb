class ActivityRecord < ActiveRecord::Base
  belongs_to :activity
  belongs_to :activity_log
  belongs_to :user
  #validates :activity_log_id, presence: true
  validates :activity_id, presence: true
end
