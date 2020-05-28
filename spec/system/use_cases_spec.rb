RSpec.describe 'Use cases' do
  context 'when creating a user' do
    let(:plan_type) { Plan::TYPE_DEVELOPER }

    it 'can create a user on any one of the plans' do
      plan = Plan.create type: plan_type
      user = UserRegistry.create_user plan: plan

      expect(user.limits.concurrent_builds).to eq plan.concurrent_builds
    end
  end

  context 'when creating an app for a user' do
    let(:app_type) { App::TYPE_PRIVATE }
    let(:user) { UserRegistry.create_user plan: Plan.free }

    it 'can create public or private apps' do
      app = AppRegistry.create_app owner: user, type: app_type

      expect(user.apps).to include app
      expect(app.type).to eq app_type
    end
  end

  context 'when dealing with public apps' do
    let(:user) { UserRegistry.create_user plan: Plan.organization }
    let(:app) { AppRegistry.create_app owner: user, type: App::TYPE_PUBLIC }

    it 'can set custom limits for the app' do
      limits = Plan.new concurrent_builds: 20, build_time_minutes: 200, builds_per_month:100, team_members:1000
      app.limits = limits

      expect(app.limits.concurrent_builds).to eq limits.concurrent_builds
    end

    it 'allows the user to opt out from the default public app limits' do
      app.use_owner_limits!

      expect(app.limits.concurrent_builds).to eq user.limits.concurrent_builds
    end
  end
end
