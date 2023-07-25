class SourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image
  has_many :forums
  includes :collection
end
