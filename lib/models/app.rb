class App
  TYPE_PRIVATE = :private
  TYPE_PUBLIC = :public

  attr_reader :type
  attr_accessor :owner

  def initialize(type:)
    @type = type
  end
end
