class Order < ApplicationRecord
    belongs_to :user
    has_many :figure_orders
    validates :total_price, presence: true
end
