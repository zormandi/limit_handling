RSpec.describe User do
  subject(:user) { User.new id: id, plan: plan }
  let(:id) { 123 }
  let(:plan) { Plan.create type: Plan::FREE }

  it { is_expected.to have_attributes id: id,
                                      plan: plan }
end
