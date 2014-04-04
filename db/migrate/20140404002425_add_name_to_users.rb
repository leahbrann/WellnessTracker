class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :namefirst, :string
    add_column :users, :namelast, :string
  end
end
