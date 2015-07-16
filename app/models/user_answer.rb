class UserAnswer < ActiveRecord::Base
  validates :user_id, :answer_choice_id, :weight, presence: true
  attr_reader :weight
  belongs_to :user
  belongs_to :answer_choice
end
