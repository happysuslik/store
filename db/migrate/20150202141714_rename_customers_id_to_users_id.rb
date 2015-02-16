class RenameCustomersIdToUsersId < ActiveRecord::Migration
  def change
    rename_column :credit_cards, :customer_id, :users_id
    rename_column :orders, :customer_id, :users_id
    rename_column :ratings, :customer_id, :users_id
  end
end
