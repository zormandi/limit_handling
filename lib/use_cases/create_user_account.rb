class CreateUserAccount
  def execute(plan_type)
    plan = Plan.create type: plan_type
    UserRegistry.create_user plan: plan
  end
end
