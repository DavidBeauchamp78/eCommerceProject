class FigureOrder < ApplicationRecord
  belongs_to :figure
  belongs_to :order
  has_many :figures
  has_many :orders
end
