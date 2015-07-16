class CreateConversationReplies < ActiveRecord::Migration
  def change
    create_table :conversation_replies do |t|
      t.integer :conv_id, null: false
      t.integer :user_id, null: false
      t.text :body
      t.timestamps
    end
    add_index :conversation_replies, :conv_id
    add_index :conversation_replies, :user_id
  end
end
