describe BlogPostsController do

  describe "GET index" do
    it "redirects to the root page" do
      get :index
      expect(response).to redirect_to root_path
    end
  end

  describe "GET show" do
    it "returns http success"
  end

  describe "GET new" do
    it "returns http success"
  end

  describe "POST create" do
    it "returns http success"
  end

  describe "GET edit" do
    it "returns http success"
  end

  describe "PATCH update" do
    it "returns http success"
  end

  describe "DELETE destroy" do
    it "returns http success"
  end

end
