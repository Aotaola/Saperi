class Collection < ApplicationRecord
    has_one :forum
    has_many :user_collections
    has_many :users, through: :user_collections

    validates :title, presence: true, length: {minimum: 5, maximum: 80}
    validates :description, length: {minimum: 5, maximum: 250}
    
end
