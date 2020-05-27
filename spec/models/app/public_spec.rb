RSpec.describe App::Public do
  subject(:app) { described_class.new limits: plan }
  let(:plan) { Plan.create type: Plan::TYPE_FREE }

  describe '#type' do
    it "returns the app's type" do
      expect(app.type).to eq App::TYPE_PUBLIC
    end
  end

  describe '#limits' do
    let(:user) { User.new id: 1, plan: Plan.create(type: Plan::TYPE_FREE) }

    it "returns the limits specified for the app" do
      app.owner = user
      expect(app.limits).to eq plan
    end
  end
end
