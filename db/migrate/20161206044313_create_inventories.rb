class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :quantity
      t.integer :proposed_trade_id

      t.timestamps

    end
  end
end
