# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity_log do
  	date { rand(1..100).days.from_now } 
	user
  end
end
