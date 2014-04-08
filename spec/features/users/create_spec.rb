require 'spec_helper'

describe "Creating a new user" do
	
	it "creates a new user successfully" do
	create_user
	expect(page).to have_content("Welcome! You have signed up successfully.")
	end
end