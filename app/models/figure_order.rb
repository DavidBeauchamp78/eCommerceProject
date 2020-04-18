class FigureOrder < ApplicationRecord
  belongs_to :figure, dependent: :destroy
  belongs_to :order, dependent: :destroy
  has_many :figures
  has_many :orders
end
