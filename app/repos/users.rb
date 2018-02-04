module Users
  class << self
    delegate :create, :guest, to: User

    def find(id)
      return guest if id.blank?

      User.find_by_id(id) || guest
    end
    alias_method :[], :find

    def exists?(email)
      !find_by_email(email).guest?
    end

    def find_by_email(email)
      User.find_by_email(email) || Guest.with_invalid_email
    end

    def sign_in(session:, email: nil, password: nil)
      find_by_email(email).tap do |user|
        store_user_in_session(user: user, session: session) if user.authenticate(password)
      end
    end

    def store_user_in_session(session:, user:)
      session[:user_id] = user.id
    end

    def remove_user_from_session(session:, user:)
      session.delete(:user_id) if session[:user_id] == user.id
    end
    alias_method :sign_out, :remove_user_from_session
  end
end