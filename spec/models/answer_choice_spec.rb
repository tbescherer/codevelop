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

require 'rails_helper'

RSpec.describe AnswerChoice, type: :model do

  it "should validate presence of question id" do
    expect(FactoryGirl.build(:answer_choice, question_id: '')).to_not be_valid
  end

  it "should validate presence of body" do
    expect(FactoryGirl.build(:answer_choice, body: '')).to_not be_valid
  end

end
