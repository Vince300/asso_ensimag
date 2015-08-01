class BlogPostController < ApplicationController
  def show
    @post = BlogPost.find(params[:id])
    @asso = @post.author
  end
end
