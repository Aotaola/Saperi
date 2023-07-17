class User < ApplicationRecord

    has_many :sources
    has_many :user_collection
    has_many :collections, through: :user_collection
    has_many :user_forums
    has_many :forums, through: :user_forums

    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'must be a valid email address' }
    validates :password, presence: true
    validates :bio, length: {minimum: 5, maximum:250}
    
end
