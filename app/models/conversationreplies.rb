class ConversationReply < ActiveRecord::Base
  validates :conv_id, :user_id, :body, presence: true
  belongs_to :user
  belongs_to :conversation,
    foreign_key: "conv_id",
    primary_key: "id",
    class_name: "Conversation"
end
