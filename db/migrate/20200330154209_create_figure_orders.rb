class CreateFigureOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :figure_orders do |t|
      t.references :figure, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
