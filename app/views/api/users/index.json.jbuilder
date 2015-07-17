json.array! @users do |user|
  json.id user.id
  json.username user.username
  json.language user.language
  # json.answer_choices user.answer_choices
  json.match_score user.match_score(current_user)
end
