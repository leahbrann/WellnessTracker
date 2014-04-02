class CreateActivityRecords < ActiveRecord::Migration
  def change
    create_table :activity_records do |t|
      t.date :date
      t.references :user, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
