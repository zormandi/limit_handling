RSpec.describe CreateUserAccount do
  describe '#execute' do
    subject(:create_user_account) { described_class.new.execute plan_type }
    let(:plan_type) { Plan::TYPE_ORGANIZATION }

    it 'registers a new User' do
      expect { create_user_account }.to change { UserRegistry.count }.by 1
    end

    it 'returns the newly created User with the specified plan' do
      user = create_user_account
      expect(user.plan).to eq Plan.create(type: plan_type)
    end
  end
end
