class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_one_id, null: false
      t.integer :user_two_id, null: false
    end
    add_index :conversations, :user_one_id
    add_index :conversations, :user_two_id
  end
end
