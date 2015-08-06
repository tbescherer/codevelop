# == Schema Information
#
# Table name: conversations
#
#  id          :integer          not null, primary key
#  user_one_id :integer          not null
#  user_two_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe Conversation, type: :model do
  it "should validate presence of user one id" do
    expect(FactoryGirl.build(:conversation, user_one_id: '')).to_not be_valid
  end

  it "should validate presence of user two id" do
    expect(FactoryGirl.build(:conversation, user_two_id: '')).to_not be_valid
  end

end
