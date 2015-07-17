json.array! @conversations do |conversation|
  json.id conversation.id
  json.user_one User.find(conversation.user_one_id)
  json.user_two User.find(conversation.user_two_id)
  json.replies conversation.replies.order('updated_at ASC') do |reply|
    json.body reply.body
    json.user User.find(reply.user_id)
  end
end
