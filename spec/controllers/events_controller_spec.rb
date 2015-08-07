describe EventsController do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET calendar" do
    it "returns http success" do
      get :calendar
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET asso_events" do
    it "returns http success"
  end

  describe "GET show" do
    it "returns http success"
  end

  describe "GET new" do
    it "returns http success"
  end

  describe "GET edit" do
    it "returns http success"
  end

  describe "POST create" do
    it "returns http success"
  end

  describe "PATCH update" do
    it "returns http success"
  end

  describe "DELETE destroy" do
    it "returns http success"
  end

end
