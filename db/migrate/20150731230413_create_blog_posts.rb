class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.datetime :published
      t.text :summary
      t.text :body
      t.references :author, index: true

      t.timestamps
    end
  end
end
