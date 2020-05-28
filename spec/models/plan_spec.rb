RSpec.describe Plan do
  describe '.create' do
    subject(:create_plan) { Plan.create type: type }

    context 'for the Free plan' do
      let(:type) { Plan::TYPE_FREE }

      it { is_expected.to be_a Plan }
      it { is_expected.to have_attributes concurrent_builds: 1,
                                          build_time_minutes: 10,
                                          builds_per_month: 200,
                                          team_members: 2 }
    end

    context 'for the Developer plan' do
      let(:type) { Plan::TYPE_DEVELOPER }

      it { is_expected.to be_a Plan }
      it { is_expected.to have_attributes concurrent_builds: 2,
                                          build_time_minutes: 45,
                                          builds_per_month: Plan::UNLIMITED,
                                          team_members: Plan::UNLIMITED }
    end

    context 'for the Organization plan' do
      let(:type) { Plan::TYPE_ORGANIZATION }

      it { is_expected.to be_a Plan }
      it { is_expected.to have_attributes concurrent_builds: 4,
                                          build_time_minutes: 90,
                                          builds_per_month: Plan::UNLIMITED,
                                          team_members: Plan::UNLIMITED }
    end

    context 'when type is unrecognized' do
      let(:type) { :unknown }

      it 'raises an error' do
        expect { create_plan }.to raise_error ArgumentError, "Unrecognized plan type 'unknown'"
      end
    end
  end

  describe '.free' do
    it 'is a shorthand for creating a Free plan' do
      expect(Plan.free).to eq Plan.create(type: Plan::TYPE_FREE)
    end
  end

  describe '.developer' do
    it 'is a shorthand for creating a Developer plan' do
      expect(Plan.developer).to eq Plan.create(type: Plan::TYPE_DEVELOPER)
    end
  end

  describe '.organization' do
    it 'is a shorthand for creating an Organization plan' do
      expect(Plan.organization).to eq Plan.create(type: Plan::TYPE_ORGANIZATION)
    end
  end
end
