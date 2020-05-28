class UserRegistry
  class << self
    def create_user(plan:)
      User.new(plan: plan).tap { |new_user| users << new_user }
    end

    def count
      users.count
    end

    def clear
      @users = []
    end

    private

    def users
      @users ||= []
    end
  end
end
