class AnswerChoice < ActiveRecord::Base
  validates :body, :question_id, presence: true
  belongs_to :question
  has_many :user_answers
  has_many :choosing_users, through: :user_answers, source: :user
end
