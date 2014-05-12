class ActivityLogsController < ApplicationController
	before_filter :find_log, :only => [:copy, :show, :destroy, :edit, :update]
	before_filter :setup_activities_and_categories, :only => [:copy, :edit, :new, :create]

def index
		@activity_logs = current_user.activity_logs.sort_by{|log|log.date}.reverse
end

def new
	@activity_log = ActivityLog.new
	@activity_records = @activity_log.activity_records.build
end

def create
	@activity_log = ActivityLog.new(activity_log_params)
	@activity_log.user = current_user
	@activity_log.create_records(params[:activity_log][:activity_ids])
		if @activity_log.save
			redirect_to activity_logs_path
		else flash.now[:alert] = @activity_log.errors.full_messages
		render "new"
		end
end

def show
end

def destroy
	@activity_log.destroy
	redirect_to activity_logs_path
end

def edit
end

def update
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
end

	private

	def activity_log_params
		params.require(:activity_log).permit(:date, :user_id, :activity_records_attributes => [:activity_id => []])
	end

	def find_log
		@activity_log = ActivityLog.find(params[:id])
	end

	def setup_activities_and_categories
		@activities = Activity.order(title: :asc)
		@categories = Category.order(title: :asc)
	end

end
