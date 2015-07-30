class RemoveUserRememberable < ActiveRecord::Migration
  def change
    remove_column :users, :remember_created_at, :datetime
    remove_column :admin_users, :remember_created_at, :datetime
  end
end
