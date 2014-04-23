class AddAdminToUser < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, :null => false, :default => false

    User.create! do |r|
      r.email      = 'default@example.com'
      r.password   = 'password'
      r.admin = true
    end
  end

  def down
    remove_column :users, :admin
    User.find_by_email('default@example.com').try(:delete)
  end
end
