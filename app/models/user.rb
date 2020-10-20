class User < ApplicationRecord
    before_save { self.email = email.downcase}
    validates :name, presence: true, length: {minimum: 5 , maximum: 15}, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 35}, uniqueness: { case_sensitive: false } , format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    has_many :articles, dependent: :destroy
end
