RSpec.describe App do
  subject(:app) { described_class.new type: type}
  let(:type) { App::TYPE_PRIVATE }

  it 'has a type' do
    expect(app).to have_attributes type: type
  end

  it 'can have an owner' do
    user = User.new id: 1, plan: Plan.create(type: Plan::TYPE_FREE)
    app.owner = user
    expect(app.owner).to eq user
  end
end
