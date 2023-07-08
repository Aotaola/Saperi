class Source < ApplicationRecord
    belongs_to :user
    belongs_to :collection

    validates :user, presence: true
    validates :collection, presence: true
    # validates :description, presence: true, lenght: {minimum: 1, maximum: 25}
    # validates :link, presence: true, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/, message: 'must be a valid URL' }
end
