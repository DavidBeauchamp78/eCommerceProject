class Figure < ApplicationRecord
    
    belongs_to :faction
    has_many :figure_orders
    
    validates :name, :description, :price, presence: true
    validates :price, numericality: true

    def self.search(faction, search)
        if "#{faction}".length > 0
            faction = Faction.find_by name: faction
            figures = faction.figures.where('name LIKE ? OR description LIKE ?', "%" + search.camelize + "%", "%" + search + "%")
        elsif "#{search}".length > 0
            figures = Figure.where('name LIKE ? OR description LIKE ?', "%" + search.camelize + "%", "%" + search + "%")
        else 
            return Figure.all
        end
    end
    # has_one_attached :image
    mount_uploader :image, ImageUploader
end
