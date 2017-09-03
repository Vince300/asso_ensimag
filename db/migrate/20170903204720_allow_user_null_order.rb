class AllowUserNullOrder < ActiveRecord::Migration
  def change
    change_column :users, :order, :integer, :null => true
  end
end
