require 'spec_helper'

describe ActivityLog do
  it {should belong_to(:user)}
end
