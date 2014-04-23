require 'spec_helper'

describe ActivityRecordsController do
	
	describe "GET #index" do
		before(:each) do
			@user = FactoryGirl.create(:user)
			sign_in @user
		end

	it "renders the index template" do
      get :index
      response.should render_template("activity_records/index")
    end

 	it "only shows activity records for the current user" do
			
			FactoryGirl.create(:activity_record, :user => @user)
			populate_records
			
			get :index
			assigns[:activity_records].to_a.should eq @user.activity_records.to_a

		end
	end


end
