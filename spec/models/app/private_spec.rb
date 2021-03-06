RSpec.describe App::Private do
  subject(:app) { described_class.new }

  describe '#type' do
    it "returns the app's type" do
      expect(app.type).to eq App::TYPE_PRIVATE
    end
  end

  describe '#limits' do
    context 'when the app has an owner' do
      let(:user) { User.new plan: Plan.free }
      before { app.owner = user }

      it "returns the owner's limits" do
        expect(app.limits).to eq user.limits
      end
    end

    context 'when the app has no owner' do
      it 'raises an error' do
        expect { app.limits }.to raise_error App::NoOwnerError
      end
    end
  end
end
