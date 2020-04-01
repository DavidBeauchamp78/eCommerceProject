class CreateFigures < ActiveRecord::Migration[6.0]
  def change
    create_table :figures do |t|
      t.string :name
      t.string :description
      t.references :faction, null: false, foreign_key: true
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
