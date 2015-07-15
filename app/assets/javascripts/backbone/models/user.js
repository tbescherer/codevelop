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
})
