class AddPublisherReferenceToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :publisher, foreign_key: true
  end
end
