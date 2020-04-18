class Figure < ApplicationRecord
  belongs_to :faction
  has_many :figure_orders

  validates :name, :description, :price, presence: true
  validates :price, numericality: true

  def self.search(faction, search)
    if !faction.to_s.empty?
      faction = Faction.find_by name: faction
      faction.figures.where("name LIKE ? OR description LIKE ?", "%" + search.camelize + "%", "%" + search + "%")
    elsif !search.to_s.empty?
      Figure.where("name LIKE ? OR description LIKE ?", "%" + search.camelize + "%", "%" + search + "%")
    else
      Figure.all
    end
  end
  # has_one_attached :image
  mount_uploader :image, ImageUploader
end
