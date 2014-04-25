class RemoveDetailsFromActivityRecords < ActiveRecord::Migration
  def change
    remove_column :activity_records, :date, :date
    remove_column :activity_records, :user_id, :integer
  end
end
