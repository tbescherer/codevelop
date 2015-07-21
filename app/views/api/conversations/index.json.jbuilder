json.array! @conversations do |conversation|
  json.id conversation.id
  json.user_one do
    json.username User.find(conversation.user_one_id).username
    json.id User.find(conversation.user_one_id).id
    json.age User.find(conversation.user_one_id).age
    json.job User.find(conversation.user_one_id).job
    json.language User.find(conversation.user_one_id).language
    json.avatar_url User.find(conversation.user_one_id).avatar.url
    json.match_score User.find(conversation.user_one_id).match_score(current_user)
  end

  json.user_two do
    json.username User.find(conversation.user_two_id).username
    json.id User.find(conversation.user_two_id).id
    json.age User.find(conversation.user_one_id).age
    json.job User.find(conversation.user_two_id).job
    json.language User.find(conversation.user_one_id).language
    json.avatar_url User.find(conversation.user_two_id).avatar.url
    json.match_score User.find(conversation.user_two_id).match_score(current_user)
  end
  
  json.replies conversation.replies.order('created_at DESC') do |reply|
    json.body reply.body
    json.user_id reply.user_id
    json.user User.find(reply.user_id)
    json.user_avatar_url User.find(reply.user_id).avatar.url
    json.time reply.updated_at
  end
end
