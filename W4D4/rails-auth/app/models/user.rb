class User < ApplicationRecord

    validates :username, :password_digest, :session_token, presence: true
    before_validation: :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && BCrypt::Password.new(user.password_digest).is_password?(password)
            return user
        end
        nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save
        self.session_token
    end
        
    def ensure_session_token
        self.session_token = User.generate_session_token unless self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end 
end

