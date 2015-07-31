class AddLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :site_url, :string
    add_column :users, :facebook_url, :string
  end
end
