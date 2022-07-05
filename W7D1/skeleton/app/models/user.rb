class User < ApplicationRecord 
    validates :username, :password_digest, presence: true 

    after_initialize :ensure_token_session 

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil 
    end

    def reset_session_token!
        self.session_token = SecureRandom::safeurl_base64(16)
        self.session_token.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        # debugger 
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    private 
    def ensure_token_session
        self.session_token ||= SecureRandom::urlsafe_base64(16)
    end
end