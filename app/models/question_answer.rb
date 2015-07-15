class QuestionAnswer < ActiveRecord::Base
  validates :user_id, :question_id, :answer_id, :weight, presence: true

  belongs_to :user
  belongs_to :question
  belongs_to :answer
end
