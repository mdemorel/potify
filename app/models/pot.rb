class Pot < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :tasks, dependent: :destroy
end
