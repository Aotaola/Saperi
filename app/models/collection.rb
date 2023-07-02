class Collection < ApplicationRecord
    has_one :forum
    has_many :users
end
