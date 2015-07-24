json.users @users do |user|
  json.id user.id
  json.username user.username
  json.language user.language
  json.answer_choices user.user_answers.map{|i| i.answer_choice}
  json.match_score user.match_score(current_user)
  json.avatar_url user.avatar.url
  json.about_field_one user.about_field_one
  json.about_field_two user.about_field_two
  json.about_field_three user.about_field_three
end

json.totalPages @users.total_pages
