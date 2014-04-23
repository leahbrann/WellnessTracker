FactoryGirl.define do 
	factory :activity_record do
		date { rand(1..100).days.from_now } 
		activity
		user
	end
	
end