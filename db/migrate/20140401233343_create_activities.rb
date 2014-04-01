class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :points
      t.references :category

      t.timestamps
    end
  end
end
