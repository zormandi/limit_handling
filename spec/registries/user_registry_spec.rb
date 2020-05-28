RSpec.describe UserRegistry do
  subject(:user_registry) { described_class }

  let(:plan) { Plan.developer }

  describe '.create_user' do
    subject(:create_user) { user_registry.create_user plan: plan }

    it 'creates and returns a User' do
      expect(create_user).to be_a User
    end

    it "sets the user's plan" do
      expect(create_user.plan).to eq plan
    end

    it 'assigns a positive id to the user' do
      expect(create_user.id).to be > 0
    end

    it "doesn't assign the same id twice" do
      user1 = user_registry.create_user plan: plan
      user2 = user_registry.create_user plan: plan
      expect(user1.id).to be < user2.id
    end
  end

  describe '.count' do
    before { user_registry.clear }

    it 'returns the number of users in the registry' do
      expect(user_registry.count).to eq 0
      expect { user_registry.create_user plan: plan }.to change { user_registry.count }.by 1
    end
  end
end
