json.extract! @question, :id, :body
json.answers @question.answer_choices
