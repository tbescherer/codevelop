Codevelop.Models.Question = Backbone.Model.extend({
  urlRoot: '/api/questions',

  parse: function(response){
    if (response.answers) {
      this.answerChoices().set(response.answers, { parse: true});
      delete response.answers;
    }
    return response;
  },


  answerChoices: function() {
    if (!this._answerChoices) {
      this._answerChoices = new Codevelop.Collections.AnswerChoices([], {question: this})
    }

    return this._answerChoices;
  },
});
