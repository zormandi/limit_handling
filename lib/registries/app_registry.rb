class AppRegistry
  def self.create_app(owner:, type:)
    App.create(type: type).tap { |app| owner.register_app app }
  end
end
