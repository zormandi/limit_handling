class App::Public < App
  DEFAULT_PUBLIC_APP_LIMITS = Plan.new concurrent_builds: 2,
                                       build_time_minutes: 45,
                                       builds_per_month: Plan::UNLIMITED,
                                       team_members: Plan::UNLIMITED

  attr_accessor :limits

  def initialize(limits: DEFAULT_PUBLIC_APP_LIMITS)
    @type = App::TYPE_PUBLIC
    @limits = limits
  end
end
