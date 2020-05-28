class UserRegistry
  class << self
    def create_user(plan:)
      @last_id ||= 0
      @last_id += 1
      User.new(id: @last_id, plan: plan).tap { |new_user| users << new_user }
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
