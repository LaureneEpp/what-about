class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.integer :name, limit: 1, default: 0
      t.string :description

      t.timestamps
    end
  end
end
