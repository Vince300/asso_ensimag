class HomeController < ApplicationController
  def index
    @posts = BlogPost.limit(5)
    @assos = User.sample(3)
    @events = Event.coming.limit(2)
  end
end
