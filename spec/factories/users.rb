FactoryGirl.define do 
	factory :user do |n|
		sequence(:username) {|n| "TestUser#{n}"}
		sequence(:namefirst) {|n| "TestFirst#{n}"}
		sequence(:namelast) {|n| "TestLast#{n}"}
		sequence(:email) { "#{namefirst}@test.com"}
		password "testtest"
		password_confirmation {"#{password}"}
	end
	
end