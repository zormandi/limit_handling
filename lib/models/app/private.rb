class App::Private < App
  def type
    App::TYPE_PRIVATE
  end

  def limits
    raise App::NoOwnerError if owner.nil?
    owner.limits
  end
end
