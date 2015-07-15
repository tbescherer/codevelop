Codevelop.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users/',

  parse: function(response){
    if (response.answer_choices) {
      this.answered_questions().set(response.answer_choices, { parse: true});
      delete response.answer_choices;
    }
    return response;
  },

  answered_questions: function() {
    if (!this._answeredQuestions) {
      this._answeredQuestions = new Codevelop.Collections.UserAnswers([], {user: this})
    }

    return this._answeredQuestions;
  },

  assess_compatibility: function(other_user) {
    var numerator = Math.round(Math.random()*100)
    var denominator = 1
    var quest_ids = other_user.answered_questions().pluck("question_id")
    this.answered_questions().each(function(question) {
      if (quest_ids.indexOf(question.id) != -1) {
        if (question.answer_id === 1) {

        } else {

        }
      }
    })
    return numerator/denominator;
  }
})
