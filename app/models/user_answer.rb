# == Schema Information
#
# Table name: user_answers
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  weight           :integer
#  explanation      :text
#  created_at       :datetime
#  updated_at       :datetime
#

class UserAnswer < ActiveRecord::Base
  validates :user_id, :answer_choice_id, :weight, presence: true
  belongs_to :user
  belongs_to :answer_choice
end
