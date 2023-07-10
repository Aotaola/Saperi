class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio,

  has_many :sources, :dependent => :destroy
end
