class FixColumnNameInCarts < ActiveRecord::Migration[5.0]
  def change
    rename_column :carts, :user_id, :account_id
  end
end
