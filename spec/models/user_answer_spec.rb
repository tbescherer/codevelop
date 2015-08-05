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

require 'rails_helper'

RSpec.describe UserAnswer, type: :model do

end
