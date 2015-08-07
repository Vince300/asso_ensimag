describe BlogPostPolicy do
  subject { BlogPostPolicy.new(user, post) }

  # Create the post (note that it creates a user for the post)
  let(:post) { create(:blog_post) }

  shared_examples "for all users" do
    it { should permit(:index) }
    it { should permit(:show) }
  end

  context "for visitors and non-author users" do
    shared_examples "for visitors and non-author users" do
      it { should_not permit(:edit) }
      it { should_not permit(:update) }
      it { should_not permit(:destroy) }
    end

    context "for a visitor" do
      let(:user) { nil }
    end

    context "for a non-author user" do
      let(:user) { create(:user) }

      # A non-author user for this post can still create posts
      it { should permit(:new) }
      it { should permit(:create) }
    end
  end

  context "for author users" do
    let(:user) { post.author }

    it { should permit(:new) }
    it { should permit(:create) }
    it { should permit(:edit) }
    it { should permit(:update) }
    it { should permit(:destroy) }
  end
end