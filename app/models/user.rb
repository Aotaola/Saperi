class User < ApplicationRecord

    has_many :sources
    has_many :users_collections
    has_many :collections, through: :users_collections
    has_many :users_forums
    has_many :forums, through: :users_forums

    has_secure_password
    
end
