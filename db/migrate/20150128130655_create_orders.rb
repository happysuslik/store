class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :amount
      t.datetime :completed_date
      t.string :state
      t.references :customer, index: true
      t.references :credit_card, index: true

      t.timestamps null: false
    end
  end
end
