class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :figure_orders, dependent: :destroy
  validates :total_price, presence: true, numericality: true
end
