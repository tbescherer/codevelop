# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  it "should validate presence of a body" do
    expect(FactoryGirl.build(:user_answer, user_id: '')).to_not be_valid
  end
end
