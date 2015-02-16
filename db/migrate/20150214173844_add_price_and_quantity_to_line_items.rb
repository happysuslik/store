class AddPriceAndQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :float
    add_column :line_items, :quantity, :integer
  end
end
