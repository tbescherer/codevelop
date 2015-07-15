Codevelop.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users/',

  parse: function(response){
    if (response.question_answers) {
      this.question_answers().set(response.question_answers, { parse: true});
      delete response.question_answers;
    }
    return response;
  },

  question_answers: function() {
    if (!this._questionAnswers) {
      this._questionAnswers = new Codevelop.Collections.QuestionAnswers([], {user: this})
    }

    return this._lists;
  }
})
