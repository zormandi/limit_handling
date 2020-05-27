RSpec.describe User do
  subject(:user) { User.new id: id, plan: plan }
  let(:id) { 123 }
  let(:plan) { Plan.create type: Plan::TYPE_FREE }

  it { is_expected.to have_attributes id: id, plan: plan }

  describe '#apps' do
    subject(:apps) { user.apps }

    context 'with no apps added' do
      it { is_expected.to be_empty }
    end

    context 'when some apps are added' do
      let(:app) { App.new type: App::TYPE_PRIVATE }

      it 'returns the apps' do
        user.register_app app
        expect(apps).to eq [app]
      end
    end
  end

  describe '#register_app' do
    let(:app) { App.new type: App::TYPE_PRIVATE }

    it 'adds an app to the user' do
      expect { user.register_app app }.to change { user.apps.count }.by 1
    end

    it "sets the app's owner to the user" do
      expect { user.register_app app }.to change { app.owner }.to user
    end
  end
end
