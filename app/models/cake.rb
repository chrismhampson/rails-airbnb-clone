class Cake < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :description ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
