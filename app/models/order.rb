class Order < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :figure_orders
  validates :total_price, presence: true, numericality: true
end
