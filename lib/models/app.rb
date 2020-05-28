class App
  TYPE_PRIVATE = :private
  TYPE_PUBLIC = :public

  attr_reader :type
  attr_accessor :owner

  def limits
    raise NotImplementedError
  end

  def self.create(type:)
    case type
    when TYPE_PRIVATE
      App::Private.new
    when TYPE_PUBLIC
      App::Public.new
    else
      raise ArgumentError, "Unrecognized app type '#{type}'"
    end
  end
end
