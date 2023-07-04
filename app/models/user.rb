class User < ApplicationRecord

    has_many :sources
    has_many :users_collections
    has_many :collections, through: :users_collections
    has_many :users_forums
    has_many :forums, through: :users_forums

    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'must be a valid email address' }
    validates :password, presence: true
    validates :bio, length: {minimum: 5, maximum:250}
    
end
