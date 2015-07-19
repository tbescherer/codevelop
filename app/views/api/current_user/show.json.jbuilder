json.extract! current_user, :username, :language
json.avatar_url current_user.avatar.url
json.answer_choices current_user.answer_choices
