# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  body        :string           not null
#  created_at  :datetime
#  updated_at  :datetime
#

class AnswerChoice < ActiveRecord::Base
  validates :body, :question_id, presence: true
  belongs_to :question
  has_many :user_answers
  has_many :choosing_users, through: :user_answers, source: :user
end
