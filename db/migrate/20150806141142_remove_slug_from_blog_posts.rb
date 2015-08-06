class RemoveSlugFromBlogPosts < ActiveRecord::Migration
  def change
    remove_column :blog_posts, :slug, :string
  end
end
