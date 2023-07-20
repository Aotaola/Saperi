class Forum < ApplicationRecord
  
  belongs_to :collection
  has_many :user_forums
  has_many :users, through: :user_forums
  has_many :sources, through: :users
  has_many :forum_sources
  has_many :sources, through: :forum_sources

  validates :collection, presence: true

end
