class AddReferenceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :role, foreign_key: true
    add_reference :posts, :user, foreign_key: true
  end
end
