class DropOrderItems < ActiveRecord::Migration
  def change
    drop_table :order_items
  end
end
