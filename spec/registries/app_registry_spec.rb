RSpec.describe AppRegistry do
  subject(:app_registry) { described_class }

  describe '.create_app' do
    subject(:create_app) { app_registry.create_app owner: user, type: app_type }
    let(:user) { User.new id: 1, plan: Plan.free }
    let(:app_type) { App::TYPE_PUBLIC }

    it 'creates and returns an App of the specified type' do
      expect(create_app).to be_an App::Public
    end

    it 'adds the app to the user' do
      app = create_app
      expect(user.apps).to include app
    end

    it "sets the app's owner" do
      expect(create_app.owner).to eq user
    end
  end
end
