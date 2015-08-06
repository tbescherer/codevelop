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
  it "should validate presence of user id" do
    expect(FactoryGirl.build(:user_answer, user_id: '')).to_not be_valid
  end

  it "should validate presence of answer choice id" do
    expect(FactoryGirl.build(:user_answer, answer_choice_id: '')).to_not be_valid
  end

  it "should validate presence of a weight" do
    expect(FactoryGirl.build(:user_answer, weight: '')).to_not be_valid
  end

end
