class AddSlugToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :slug, :string

    reversible do |dir|
      dir.up do
        BlogPost.all.each do |post|
          # Save the blog post, generating a slug
          post.save!
        end
      end

      dir.down do
        # Nothing to do
      end
    end
  end
end
