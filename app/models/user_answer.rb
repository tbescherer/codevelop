class UserAnswer < ActiveRecord::Base
  validates :user_id, :answer_choice_id, :weight, presence: true

  belongs_to :user
  belongs_to :answer_choice
end
