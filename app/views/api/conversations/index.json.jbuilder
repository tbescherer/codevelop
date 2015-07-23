json.array! @conversations do |conversation|
  json.id conversation.id
  json.user_one_id conversation.user_one_id
  json.user_two_id conversation.user_two_id
  user_one = User.find(conversation.user_one_id)
  json.user_one do
    json.username user_one.username
    json.id user_one.id
    json.age user_one.age
    json.job user_one.job
    json.language user_one.language
    json.avatar_url user_one.avatar.url
    json.match_score user_one.match_score(current_user)
  end

  user_two = User.find(conversation.user_two_id)
  json.user_two do
    json.username user_two.username
    json.id user_two.id
    json.age user_two.age
    json.job user_two.job
    json.language user_two.language
    json.avatar_url user_two.avatar.url
    json.match_score user_two.match_score(current_user)
  end

  json.replies conversation.replies.order('created_at ASC') do |reply|
    json.body reply.body
    json.user_id reply.user_id
    json.user User.find(reply.user_id)
    json.user_avatar_url User.find(reply.user_id).avatar.url
    json.time reply.updated_at
  end
end
