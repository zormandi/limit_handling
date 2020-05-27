class App
  TYPE_PRIVATE = :private
  TYPE_PUBLIC = :public

  DEFAULT_PUBLIC_APP_LIMITS = Plan.new(concurrent_builds: 2,
                                       build_time_minutes: 45,
                                       builds_per_month: Plan::UNLIMITED,
                                       team_members: Plan::UNLIMITED).freeze

  attr_reader :type
  attr_accessor :owner

  def limits
    raise NotImplementedError
  end

  def self.create(type:)
    case type
    when TYPE_PRIVATE
      App::Private.new
    when TYPE_PUBLIC
      App::Public.new limits: DEFAULT_PUBLIC_APP_LIMITS
    else
      raise ArgumentError, "Unrecognized app type '#{type}'"
    end
  end
end
