class AddPictureToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :picture, :string
  end
end
