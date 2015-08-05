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

end
