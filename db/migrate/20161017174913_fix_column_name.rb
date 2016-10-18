class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :emils, :email
  end
end
