json.id @conversation.id
json.user_one_id @conversation.user_one_id
json.user_two_id @conversation.user_two_id
json.user_one User.find(@conversation.user_one_id)
json.user_two User.find(@conversation.user_two_id)
json.replies @conversation.replies.order('updated_at DESC') do |reply|
  json.body reply.body
  json.user_id reply.user_id
  json.user User.find(reply.user_id)
end