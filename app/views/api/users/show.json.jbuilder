json.extract! @user, :id, :username, :language
json.match_score @user.match_score(current_user)
json.answer_choices @user.answer_choices do |answer|
  json.id answer.id
  json.question_id answer.question_id
  json.body answer.body
end
