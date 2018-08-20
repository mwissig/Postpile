require 'faker'

class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :email
      t.string :password_hash
      t.datetime :created_at
      t.datetime :updated_at
end
add_index :users, :username, unique: true
  end
end
