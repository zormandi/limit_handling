class App::Public < App
  def initialize(limits:)
    @type = App::TYPE_PUBLIC
    @limits = limits.freeze
  end

  def limits
    @limits
  end
end
