class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image
  has_many :forums
end
