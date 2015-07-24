json.id @conversation.id
json.user_one_id @conversation.user_one_id
json.user_two_id @conversation.user_two_id

json.user_one do
  json.username @conversation.user_one.username
  json.id @conversation.user_one.id
  json.age @conversation.user_one.age
  json.job @conversation.user_one.job
  json.language @conversation.user_one.language
  json.avatar_url @conversation.user_one.avatar.url
  json.match_score @conversation.user_one.match_score(current_user)
end

json.user_two do
  json.username @conversation.user_two.username
  json.id @conversation.user_two.id
  json.age @conversation.user_two.age
  json.job @conversation.user_two.job
  json.language @conversation.user_two.language
  json.avatar_url @conversation.user_two.avatar.url
  json.match_score @conversation.user_two.match_score(current_user)
end

json.replies @conversation.replies do |reply|
  json.body reply.body
  json.user_id reply.user_id
  json.user reply.user
  json.user_avatar_url User.find(reply.user_id).avatar.url
  json.time time_ago_in_words(reply.updated_at)
end
