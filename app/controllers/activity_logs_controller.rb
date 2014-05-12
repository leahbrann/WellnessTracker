class ActivityLogsController < ApplicationController

def index
		@activity_logs = current_user.activity_logs.sort_by{|log|log.date}.reverse
end

def new
	@activity_log = ActivityLog.new
	@activity_records = @activity_log.activity_records.build
	@activities = Activity.order(title: :asc)
	@categories = Category.order(title: :asc)
end

def create
	@activity_log = ActivityLog.new(activity_log_params)
	@activity_log.user = current_user
	@activities = Activity.order(title: :asc)
	@categories = Category.order(title: :asc)
	@activity_log.create_records(params[:activity_log][:activity_ids])
		if @activity_log.save
			redirect_to activity_logs_path
		else flash.now[:alert] = @activity_log.errors.full_messages
		render "new"
		end
end

def show
	@activity_log = ActivityLog.find(params[:id])
end

def destroy
	@activity_log = ActivityLog.find(params[:id])
	@activity_log.destroy
	redirect_to activity_logs_path
end

def edit
	@activity_log = ActivityLog.find(params[:id])
	@activities = Activity.order(title: :asc)
	@categories = Category.order(title: :asc)

end

def update
	@activity_log = ActivityLog.find(params[:id])
	@activity_log.update(activity_log_params)
	@activity_log.activity_records.destroy_all
	@activity_log.create_records(params[:activity_log][:activity_ids])
		if @activity_log.save
			redirect_to activity_logs_path
		else flash.now[:alert] = "Could not save"
		render "new"
		end
end

def copy
	@activity_log = ActivityLog.find(params[:id])
	@activities = Activity.order(title: :asc)
	@categories = Category.order(title: :asc)
end

	private

	def activity_log_params
		params.require(:activity_log).permit(:date, :user_id, :activity_records_attributes => [:activity_id => []])
	end

end
