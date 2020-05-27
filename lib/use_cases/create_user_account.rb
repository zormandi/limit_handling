class CreateUserAccount
  def execute(plan_type)
    plan = Plan.create type: plan_type
    UserRegistry.create with_plan: plan
  end
end
