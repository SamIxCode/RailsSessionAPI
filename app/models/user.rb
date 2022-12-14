class User < ApplicationRecord
    has_secure_password
    
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    
    def asign_default_role
        self.role = 'client'
    end
end
