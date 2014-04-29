require 'spec_helper'

describe ActivityRecord do
  it {should belong_to(:activity_log)}
  it {should belong_to(:activity)}
end
