class Conversation < ActiveRecord::Base
  validates :user_one_id, :user_two_id, presence: true
  has_many :replies,
    foreign_key: "conv_id",
    primary_key: "id",
    class_name: "ConversationReply"

  belongs_to :user_one,
    foreign_key: "user_one_id",
    primary_key: "id",
    class_name: "User"

  belongs_to :user_two,
    foreign_key: "user_two_id",
    primary_key: "id",
    class_name: "User"

  def self.by_user(user_id)
    where("user_one_id = :user_id OR user_two_id = :user_id", user_id: user_id)
  end

end
