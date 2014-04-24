require 'spec_helper'

describe User do
	it {should have_many(:activity_records)}
	it {should validate_presence_of(:namefirst)}
	it {should validate_presence_of(:namelast)}
end