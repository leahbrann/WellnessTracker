require 'spec_helper'

describe TeamMembership do
  it {should validate_uniqueness_of(:user_id).
  	with_message('can only belong to one team')}
end
