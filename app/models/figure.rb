class Figure < ApplicationRecord
    belongs_to :faction
    has_many :figure_orders
    
    validates :name, :description, :price, presence: true
    validates :price, numericality: true

    # has_one_attached :image
end
