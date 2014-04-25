class AddActivityLogRefToActivityRecords < ActiveRecord::Migration
  def change
    add_reference :activity_records, :activity_log, index: true
  end
end
