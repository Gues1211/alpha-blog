class User < ActiveRecord::Base
    has_many :articles
    
    before_save { self.email = email.downcase }
    validates :username, presence: true,
        uniqueness: {case_sensitive: false},
        length: {minimum: 3, maximum: 35}
    
    VALID_EMAIL_REGEX= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: {maximum: 105}, 
        uniqueness: {case_sensitive: false},
        format: {with: VALID_EMAIL_REGEX}
    has_secure_password
end 