class ActivityRecordsController < ApplicationController

	def index
		@activity_records = ActivityRecord.all
	end

	def new
		@activity_record = ActivityRecord.new
		@activities = Activity.all
		@categories = Category.all		
	end

	def create

		@activities = Activity.all
		@categories = Category.all
		#@user = current_user
		#@activity_record = @user.activity_records.create(params[:activityrecord])
		@activity_record = ActivityRecord.create(activity_record_params)
		@activity_record.user = current_user
		if @activity_record.save
			redirect_to activity_records_path
		else flash.now[:alert] = "Could not save"
		render "new"
		end

	end


private

	def activity_record_params
		params.require(:activity_record).permit(:date, :user_id, :activity_id)
	end

end
