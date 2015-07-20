json.extract! @user, :id, :username, :language, :about_field_one, :about_field_two, :about_field_three, :age, :job, :looking_for
json.avatar_url @user.avatar.url
json.match_score @user.match_score(current_user)
json.answer_choices @user.answer_choices do |answer|
  json.id answer.id
  json.question_id answer.question_id
  json.body answer.body
end
