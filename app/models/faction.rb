class Faction < ApplicationRecord
  has_many :figures, dependent: :delete
  validates :name, presence: true
end
