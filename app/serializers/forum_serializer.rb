class ForumSerializer < ActiveModel::Serializer
  belongs_to :collection
  
  attributes :id
  has_many :user_forums
  has_many :users, through: :user_forums
  has_many :sources, through: :users
  
end
