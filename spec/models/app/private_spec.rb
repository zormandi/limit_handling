RSpec.describe App::Private do
  subject(:app) { described_class.new }

  describe '#type' do
    it "returns the app's type" do
      expect(app.type).to eq App::TYPE_PRIVATE
    end
  end

  describe '#limits' do
    let(:user) { User.new id: 1, plan: Plan.create(type: Plan::TYPE_FREE) }

    it "returns the owner's limits" do
      app.owner = user
      expect(app.limits).to eq user.limits
    end

    context 'when the app has no owner' do
      it 'returns nil' do
        expect(app.limits).to be nil
      end
    end
  end
end
