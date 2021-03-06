RSpec.describe App::Public do
  subject(:app) { described_class.new }

  describe '#type' do
    it "returns the app's type" do
      expect(app.type).to eq App::TYPE_PUBLIC
    end
  end

  describe '#limits' do
    it "returns the app's limits which are the standard public app limits by default" do
      expect(app.limits).to have_attributes concurrent_builds: 2,
                                            build_time_minutes: 45,
                                            builds_per_month: Plan::UNLIMITED,
                                            team_members: Plan::UNLIMITED
    end

    context 'when explicitly specifying limits for the app' do
      subject(:app) { described_class.new limits: plan }
      let(:plan) { Plan.create type: Plan::TYPE_FREE }

      it 'returns the limits specified for the app' do
        expect(app.limits).to eq plan
      end
    end

    context "when the app has no owner but is set to use the owner's limits" do
      it 'raises an error' do
        app.use_owner_limits!
        expect { app.limits }.to raise_error App::NoOwnerError
      end
    end
  end

  describe '#limits=' do
    let(:plan) { Plan.free }

    it "sets the app's limits to the specified plan" do
      expect { app.limits = plan }.to change { app.limits }.to plan
    end
  end

  describe '#use_owner_limits!' do
    let(:user) { User.new plan: Plan.organization }
    before { app.owner = user }

    it "allows the app to use the owner's limits instead of its own" do
      app.use_owner_limits!
      expect(app.limits).to eq user.limits
    end
  end
end
