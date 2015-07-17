json.array! @users do |user|
  json.id user.id
  json.about_field_one user.about_field_one
  json.about_field_two user.about_field_two
  json.about_field_three user.about_field_three
  json.username user.username
  json.language user.language
  json.answer_choices user.answer_choices
  json.match_score user.match_score(current_user)
end
