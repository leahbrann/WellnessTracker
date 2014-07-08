class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.references :user, index: true
      t.references :team, index: true
      t.boolean :captain, default: false

      t.timestamps
    end
  end
end
