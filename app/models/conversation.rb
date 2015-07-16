class Conversation < ActiveRecord::Base
  validates :user_one_id, :user_two_id, presence: true
  has_many :conversation_replies,
    foreign_key: "conv_id",
    primary_key: "id",
    class_name: "ConversationReplies"

end
