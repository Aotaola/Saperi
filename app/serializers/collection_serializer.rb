class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  has_many :user_collections
  has_many :users, through: :user_collections
  has_many :collection_sources
  has_many :sources, through: :collection_sources
  has_one :forum
end
