class User
  attr_reader :id, :plan

  def initialize(id:, plan:)
    @id = id
    @plan = plan
  end
end
