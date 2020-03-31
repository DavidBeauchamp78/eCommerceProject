class CreateFigures < ActiveRecord::Migration[6.0]
  def change
    create_table :figures do |t|
      t.string :name
      t.string :description
      t.string :faction
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
