class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  has_many :user_collections
  has_many :users, through: :user_collections
  has_one :forum
end
