class App::Private < App
  def type
    App::TYPE_PRIVATE
  end

  def limits
    return nil if owner.nil?
    owner.limits
  end
end
