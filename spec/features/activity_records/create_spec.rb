require 'spec_helper'

describe "Creating an activity record" do 


	def create_activity_record(params={})
		FactoryGirl.create(:category)
		FactoryGirl.create(:activity)
		params[:activity] ||= 'Physical Chores'
		params[:date] ||= "2014-04-14"

		visit "/activity_records"
	click_link "Log an activity"
	expect(page).to have_content("Log an activity")

	select(params[:activity], :from  => 'activity_record[activity_id]')
	fill_in "datepicker", with: params[:date]
	click_button "Create Activity record"
	end

	it "redirects to the activity_record index on success" do
	create_user
	create_activity_record

	expect(page).to have_content("My Activities")
	end

end