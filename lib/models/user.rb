class User
  attr_reader :id, :plan, :apps

  def initialize(id:, plan:)
    @id = id
    @plan = plan
    @apps = []
  end

  def register_app(app)
    @apps << app
    app.owner = self
  end
end
