# == Schema Information
#
# Table name: conversation_replies
#
#  id         :integer          not null, primary key
#  conv_id    :integer          not null
#  user_id    :integer          not null
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class ConversationReply < ActiveRecord::Base
  validates :conv_id, :user_id, :body, presence: true
  belongs_to :user
  belongs_to :conversation,
    foreign_key: "conv_id",
    primary_key: "id",
    class_name: "Conversation"
end
