json.id @conversation.id
json.user_one User.find(@conversation.user_one_id)
json.user_two User.find(@conversation.user_two_id)
json.replies @conversation.replies.order('updated_at ASC') do |conversation|
  json.body conversation.body
  json.user User.find(conversation.user_id)
end
