class CreatePmsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :pms do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :message
      t.datetime :created_at
    end
  end
end
