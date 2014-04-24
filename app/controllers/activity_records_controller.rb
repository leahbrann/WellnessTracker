class ActivityRecordsController < ApplicationController

	def index
		@activity_records = current_user.activity_records.sort_by{|record|record.date}.reverse
	end

	def new
		@activity_record = ActivityRecord.new
		@activities = Activity.all
		@categories = Category.all		
	end

	def create

		@activities = Activity.all
		@categories = Category.all
		@activity_record = ActivityRecord.create(activity_record_params)
		@activity_record.user = current_user
		if @activity_record.save
			redirect_to activity_records_path
		else flash.now[:alert] = "Could not save"
		render "new"
		end

	end

	def destroy
		@activity_record = ActivityRecord.find(params[:id])
		@activity_record.destroy
		redirect_to activity_records_path
	end

	def edit
		@activity_record = ActivityRecord.find(params[:id])
		@activities = Activity.all
		@categories = Category.all
	end

	def update
		@activity_record = ActivityRecord.find(params[:id])
		@activity_record.update(activity_record_params)
		redirect_to activity_records_path
	end
	


private

	def activity_record_params
		params.require(:activity_record).permit(:date, :user_id, :activity_id)
	end

end
