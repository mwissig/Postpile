class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.string :body
      t.string :image_url
      t.integer :likes
      t.datetime :created_at
      t.datetime :updated_at
end
  end
end
