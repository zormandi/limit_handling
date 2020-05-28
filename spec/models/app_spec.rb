RSpec.describe App do
  subject(:app) { described_class.new }

  describe '.create' do
    subject(:created_app) { App.create type: type }

    context 'when app type is private' do
      let(:type) { App::TYPE_PRIVATE }

      it 'creates a private app' do
        expect(created_app).to be_an App::Private
      end
    end

    context 'when app type is public' do
      let(:type) { App::TYPE_PUBLIC }

      it 'creates a public app' do
        expect(created_app).to be_an App::Public
      end

      it 'creates an app with the default public app limits' do
        expect(created_app.limits).to eq App::Public::DEFAULT_PUBLIC_APP_LIMITS
      end
    end

    context 'when app type is unknown' do
      let(:type) { :unknown }

      it 'raises an error' do
        expect { created_app }.to raise_error ArgumentError, "Unrecognized app type 'unknown'"
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
      let(:user) { User.new id: 1, plan: Plan.free }
      before { app.owner = user }

      it { is_expected.to be user }
    end
  end
end
