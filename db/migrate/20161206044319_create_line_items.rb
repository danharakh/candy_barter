class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :inventory_id
      t.integer :proposed_trade_id
      t.string :quantity

      t.timestamps

    end
  end
end
