require 'spec_helper'

describe "Creating an activity log" do 

	def setup_activities
		FactoryGirl.create(:category)
		FactoryGirl.create(:activity)
		$paramsactivity ||= 'Physical Chores'
		$paramsdate1i ||=  "2014"
		$paramsdate2i ||= "April"
		$paramsdate3i ||= "14"
	end

	def create_activity_log(params={})
	visit "/activity_logs"
	click_button "Log a new day"
	expect(page).to have_content("New Log")

	select($paramsactivity, :from  => 'activity_log[activity_ids][]')
	select $paramsdate1i , :from=> "activity_log_date_1i" 
	select $paramsdate2i , :from=> "activity_log_date_2i"
	select $paramsdate3i , :from=> "activity_log_date_3i"  
	click_button "Save Log"
	end

	it "redirects to the activity_log index on success" do
	create_user
	setup_activities
	create_activity_log

	expect(page).to have_content("My Logs")
	end

	it "fails when a log already exists for the same user and date" do
	create_user
	setup_activities
	create_activity_log
	expect(page).to have_content("My Logs")
	create_activity_log

	expect(page).to have_content("Date must be unique")

	end


end