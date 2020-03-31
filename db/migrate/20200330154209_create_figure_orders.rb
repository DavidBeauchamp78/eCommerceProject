class CreateFigureOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :figure_orders do |t|
      t.integer :figure_id
      t.integer :order_id

      t.timestamps
    end
  end
end
