class CreateTableUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
    end
    add_index :users, :username, unique: true
  end
end
