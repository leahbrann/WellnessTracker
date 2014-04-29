require 'spec_helper'

describe ActivityLogsController do
	describe "GET #index" do
		before(:each) do
			@user = FactoryGirl.create(:user)
			sign_in @user
		end

	it "renders the index template" do
      get :index
      response.should render_template("activity_logs/index")
    end

 	it "only shows activity logs for the current user" do
			
			FactoryGirl.create(:activity_log, :user => @user)
			populate_records
			
			get :index
			assigns[:activity_logs].to_a.should eq @user.activity_logs.to_a

		end
	end
end
