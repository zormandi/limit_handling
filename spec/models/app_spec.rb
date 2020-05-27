RSpec.describe App do
  subject(:app) { described_class.new }

  describe '.create' do
    subject(:app) { App.create type: type }

    context 'when app type is private' do
      let(:type) { App::TYPE_PRIVATE }

      it 'creates a private app' do
        expect(app).to be_an App::Private
      end
    end

    context 'when app type is public' do
      let(:type) { App::TYPE_PUBLIC }

      it 'creates a public app' do
        expect(app).to be_an App::Public
      end

      it 'sets the default public app limits' do
        expect(app.limits).to have_attributes concurrent_builds: 2,
                                              build_time_minutes: 45,
                                              builds_per_month: Plan::UNLIMITED,
                                              team_members: Plan::UNLIMITED
      end
    end

    context 'when app type is unknown' do
      let(:type) { :unknown }

      it 'raises an error' do
        expect { app }.to raise_error ArgumentError, "Unrecognized app type 'unknown'"
      end
    end
  end

  describe '#limits' do
    it 'raises an error to enforce implementation in subclasses' do
      expect { app.limits }.to raise_error NotImplementedError
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
