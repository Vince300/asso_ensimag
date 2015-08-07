describe UserPolicy do
  subject { UserPolicy.new(user, asso) }

  # Create the asso to be edited
  let(:asso) { create(:user) }

  shared_examples "for all users" do
    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:detail) }
    it { should_not permit(:new) }
    it { should_not permit(:create) }
  end

  context "for other users and visitors" do
    shared_examples "for other users and visitors" do
      it { should_not permit(:edit) }
      it { should_not permit(:update) }
    end

    context "for visitors" do
      let(:user) { nil }
    end

    context "for other users" do
      let(:user) { create(:user) }
    end
  end

  context "for the current user" do
    let(:user) { asso }

    it { should permit(:edit) }
    it { should permit(:update) }
  end
end