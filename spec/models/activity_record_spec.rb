require 'spec_helper'

describe ActivityRecord do
  it {should belong_to(:user)}
  it {should belong_to(:activity)}
end
