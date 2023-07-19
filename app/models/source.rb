class Source < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  # validates :link, presence: true, format: { with: /\A#{URI::DEFAULT_PARSER.make_regexp(['http', 'https'])}\z/, message: "must be a valid URL" }
end
