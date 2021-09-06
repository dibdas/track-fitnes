class User < ApplicationRecord
    has_secure_password
    has_many :measurements
    validates :name, presence: true
    validates :password_digest, presence: true
    validates :email, presence: true
end
