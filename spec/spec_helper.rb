# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'capybara/rails'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include Capybara::DSL
  config.include Devise::TestHelpers, :type => :controller

end

def create_user
    @user = FactoryGirl.build(:user)
    visit "/"
    click_link "Sign Up!"
    fill_in "user[username]", with: @user.username
    fill_in "user[namefirst]", with: @user.namefirst
    fill_in "user[namelast]", with: @user.namelast
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    fill_in "user[password_confirmation]", with: @user.password_confirmation
    click_button "Sign up"    
  end

  def populate_records
    FactoryGirl.create_list(:activity_record, 10)
  end

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
  click_button "Log Daily Points"
  expect(page).to have_content("New Log")

  select($paramsactivity, :from  => 'activity_log[activity_ids][]')
  select $paramsdate1i , :from=> "activity_log_date_1i" 
  select $paramsdate2i , :from=> "activity_log_date_2i"
  select $paramsdate3i , :from=> "activity_log_date_3i"  
  click_button "Save Log"
  end
