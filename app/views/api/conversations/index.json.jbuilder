json.array! @conversations do |conversation|
  json.id conversation.id
  json.user_one User.find(conversation.user_one_id)
  json.user_two User.find(conversation.user_two_id)
  json.latest_reply do
    json.body conversation.replies.order('updated_at DESC').first.body
    json.user User.find(conversation.replies.order('updated_at DESC').first.user_id)
  end
end
