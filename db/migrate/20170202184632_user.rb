class User < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
      t.string :email, null: false, uniqueness: true
      t.string :password, null: false
      t.integer :age
      t.text :description
    end
  end
end
