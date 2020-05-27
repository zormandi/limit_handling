class Plan
  TYPE_FREE = :free
  TYPE_DEVELOPER = :developer
  TYPE_ORGANIZATION = :organization

  UNLIMITED = Float::INFINITY

  attr_reader :concurrent_builds, :build_time_minutes, :builds_per_month, :team_members

  def self.create(type:)
    case type
    when TYPE_FREE
      new concurrent_builds: 1, build_time_minutes: 10, builds_per_month: 200, team_members: 2
    when TYPE_DEVELOPER
      new concurrent_builds: 2, build_time_minutes: 45, builds_per_month: UNLIMITED, team_members: UNLIMITED
    when TYPE_ORGANIZATION
      new concurrent_builds: 4, build_time_minutes: 90, builds_per_month: UNLIMITED, team_members: UNLIMITED
    else
      raise ArgumentError, 'Unrecognized plan type'
    end
  end

  def initialize(concurrent_builds:, build_time_minutes:, builds_per_month:, team_members:)
    @concurrent_builds = concurrent_builds
    @build_time_minutes = build_time_minutes
    @builds_per_month = builds_per_month
    @team_members = team_members
  end

  def ==(plan)
    concurrent_builds == plan.concurrent_builds &&
      build_time_minutes == plan.build_time_minutes &&
      builds_per_month == plan.builds_per_month &&
      team_members == plan.team_members
  end
end
