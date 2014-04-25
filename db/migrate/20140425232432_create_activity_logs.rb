class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
    	t.date :date
      	t.references :user, index: true

      t.timestamps
    end
  end
end
