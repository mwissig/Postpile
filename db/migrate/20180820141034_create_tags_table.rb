class CreateTagsTable < ActiveRecord::Migration[5.2]
  def change
        create_table :tags do |t|
    t.string :post_id
  end
  end
end
