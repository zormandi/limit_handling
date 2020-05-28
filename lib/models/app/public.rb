class App::Public < App
  DEFAULT_PUBLIC_APP_LIMITS = Plan.new concurrent_builds: 2,
                                       build_time_minutes: 45,
                                       builds_per_month: Plan::UNLIMITED,
                                       team_members: Plan::UNLIMITED

  attr_accessor :limits

  def initialize(limits: DEFAULT_PUBLIC_APP_LIMITS)
    @limits = limits
    @use_owner_limits = false
  end

  def type
    App::TYPE_PUBLIC
  end

  def limits
    if @use_owner_limits
      raise App::NoOwnerError if owner.nil?
      owner.limits
    else
      @limits
    end
  end

  def use_owner_limits!
    @use_owner_limits = true
  end
end
