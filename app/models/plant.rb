class Plant < ApplicationRecord
  has_many :pots, dependent: :destroy
end
