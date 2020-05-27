RSpec.describe App do
  subject(:app) { described_class.new type: type }
  let(:type) { App::TYPE_PRIVATE }

  describe '#type' do
    it "returns the app's type" do
      expect(app.type).to eq type
    end
  end

  describe '#owner' do
    subject(:owner) { app.owner }

    context 'when no owner is set' do
      it { is_expected.to be nil }
    end

    context 'when the owner is set' do
      let(:user) { User.new id: 1, plan: Plan.create(type: Plan::TYPE_FREE) }
      before { app.owner = user }

      it { is_expected.to be user }
    end
  end
end
