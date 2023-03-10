class AddInfoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    rename_column :users, :mast_name, :last_name
  end
end
