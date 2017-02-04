class AddUniqueId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rid, :string
    add_index :users, :rid, unique: true
  end
end
