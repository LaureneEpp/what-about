class RemoveRefFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:posts, :publisher, index: true, foreign_key: true)
  end
end
