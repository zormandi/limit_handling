RSpec.describe App::Public do
  subject(:app) { described_class.new }

  describe '#type' do
    it "returns the app's type" do
      expect(app.type).to eq App::TYPE_PUBLIC
    end
  end

  describe '#limits' do
    let(:user) { User.new id: 1, plan: Plan.free }

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
  end
end
