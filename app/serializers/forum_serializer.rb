class ForumSerializer < ActiveModel::Serializer
  attributes :id
  has_many :user_forums
  has_many :users, through: :user_forums
  
end
