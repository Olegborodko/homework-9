class ChangeColumnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :rid, :string, null: false
  end
end
