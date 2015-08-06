# == Schema Information
#
# Table name: conversation_replies
#
#  id         :integer          not null, primary key
#  conv_id    :integer          not null
#  user_id    :integer          not null
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe ConversationReply, type: :model do

  it "should validate presence of user id" do
    expect(FactoryGirl.build(:conversation_reply, user_id: '')).to_not be_valid
  end

  it "should validate presence of conv id" do
    expect(FactoryGirl.build(:conversation_reply, conv_id: '')).to_not be_valid
  end

  it "should validate presence of body" do
    expect(FactoryGirl.build(:conversation_reply, body: '')).to_not be_valid
  end

end
