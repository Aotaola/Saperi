class SourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image
  has_many :forums
  #include :collection
end
