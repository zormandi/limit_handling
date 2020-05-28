class User
  attr_reader :plan, :apps
  alias_method :limits, :plan

  def initialize(plan:)
    @plan = plan
    @apps = []
  end

  def register_app(app)
    @apps << app
    app.owner = self
  end
end
