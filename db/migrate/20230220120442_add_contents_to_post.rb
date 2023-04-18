class AddContentsToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :subtitle, :string
    add_column :posts, :state, :string, default: "draft"
    add_column :posts, :published_at, :datetime
  end
end
