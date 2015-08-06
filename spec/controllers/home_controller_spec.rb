describe HomeController do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

    it "returns the most recent blog posts" do
      posts = create_list(:blog_post, 20).sort_by { |post| post.published } .select { |post| post.published? } .last(5)
      get :index
      expect(assigns(:posts)).to match_array posts
      expect(assigns(:posts).length).to be <= 5
    end

    it "returns the coming events" do
      events = create_list(:event, 6).sort_by { |event| event.start_time } .select { |event| event.coming? } .first(3)
      get :index
      expect(assigns(:events)).to match_array events
      expect(assigns(:events).length).to be <= 3
    end

    it "returns random users" do
      assos = create_list(:user, 5)
      get :index
      expect(assigns(:assos).length).to be <= 3
      expect(assos).to include(*assigns(:assos))
    end
  end

end
