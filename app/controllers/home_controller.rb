class HomeController < ApplicationController
  def index
    @posts = BlogPost.published.limit(5)
    @assos = User.sample(3)
    @events = Event.published.coming.limit(3)
  end
end
