class Plant < ApplicationRecord
  has_many :pots, dependent: :destroy

  include PgSearch
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
