class RenameLastnameToUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :mast_name, :last_name
    add_column :users, :username, :string
  end
end
