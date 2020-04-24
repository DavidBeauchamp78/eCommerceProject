class Faction < ApplicationRecord
  has_many :figures, dependent: :destroy
  validates :name, presence: true
end
