class CollectionSourceSerializer < ActiveModel::Serializer
  attributes :id
  has_one :source
  has_one :collection
end
