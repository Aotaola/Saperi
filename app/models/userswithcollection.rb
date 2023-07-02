class Userswithcollection < ApplicationRecord
  belongs_to :collection
  belongs_to :users
end
