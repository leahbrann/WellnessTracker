class ActivityLogController < ApplicationController

def index
		@activity_logs = current_user.activity_logs.sort_by{|log|log.date}.reverse
end

def new
	@activity_log = ActivityLog.new
end

def create
end




	private

	def activity_log_params
		params.require(:activity_log).permit(:date, :user_id, :activity_records_attributes[:activity_id])
	end
end
