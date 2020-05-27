class App::Private < App
  def initialize
    @type = App::TYPE_PRIVATE
  end

  def limits
    return nil if owner.nil?
    owner.limits
  end
end
