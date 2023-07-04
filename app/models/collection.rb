class Collection < ApplicationRecord
    has_one :forum
    has_many :users

    validates :title, presence: true, length: {minimum: 5, maximum: 80}
    validates :description, length: {minimum: 5, maximum: 250}
    
end
