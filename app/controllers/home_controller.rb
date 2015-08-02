class HomeController < ApplicationController
  def index
    @posts = BlogPost.order(published: :desc).limit(5)
    @assos = User.limit(3)
  end
end
