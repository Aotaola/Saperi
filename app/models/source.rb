class Source < ApplicationRecord
  belongs_to :user
  has_many :forum_sources
  has_many :forums, through: :forum_sources
  has_many :collection_sources
  has_many :collections, through: :collection_sources 
  
  validates :user, presence: true
  # validates :link, presence: true, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/, message: "must be a valid URL" }
end
