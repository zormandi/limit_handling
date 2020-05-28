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
  end

  describe '.count' do
    before { user_registry.clear }

    it 'returns the number of users in the registry' do
      expect { user_registry.create_user plan: plan }.to change { user_registry.count }.from(0).to 1
    end
  end
end
