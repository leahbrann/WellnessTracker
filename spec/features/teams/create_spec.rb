require 'spec_helper'
describe "Creating a new team" do
	
	it "creates a new team successfully" do
	create_user
	visit teams_path
	click_link "Create a team"
	fill_in "team[name]", with: "NewTeam"
	click_button "Create Team" 
	expect(page).to have_content("NewTeam")
	end
end