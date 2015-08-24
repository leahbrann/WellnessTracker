require 'spec_helper'

describe "Creating an activity log" do 

	before(:each) do
		create_user
		setup_activities
		create_activity_log
	end

	it "redirects to the activity_log index on success" do
		expect(page).to have_content("My Logs")
	end

	it "fails when a log already exists for the same user and date" do
		expect(page).to have_content("My Logs")
		create_activity_log

		expect(page).to have_content("Date must be unique")

	end


end