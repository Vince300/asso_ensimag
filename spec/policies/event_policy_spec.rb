describe EventPolicy do
  subject { EventPolicy.new(user, event) }

  # Create the event (note that it creates a user for the event)
  let(:event) { create(:event) }

  shared_examples "for all users" do
    it { should permit(:index) }
    it { should permit(:show) }
  end

  context "for visitors and non-owner users" do
    shared_examples "for visitors and non-owner users" do
      it { should_not permit(:edit) }
      it { should_not permit(:update) }
      it { should_not permit(:destroy) }
    end

    context "for a visitor" do
      let(:user) { nil }
    end

    context "for a non-owner user" do
      let(:user) { create(:user) }

      # A non-owner user for this event can still create events
      it { should permit(:new) }
      it { should permit(:create) }
    end
  end

  context "for owner users" do
    let(:user) { event.asso }

    it { should permit(:new) }
    it { should permit(:create) }
    it { should permit(:edit) }
    it { should permit(:update) }
    it { should permit(:destroy) }
  end
end