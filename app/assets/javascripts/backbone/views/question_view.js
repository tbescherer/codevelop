Codevelop.Views.QuestionView = Backbone.View.extend({
  template: JST['current_user/questions'],

  events: {
    "submit #user-answer": "submitUserAnswer",
    "click .skip-question": "skipQuestion"
  },

  initialize: function(options) {
    this.listenTo(this.model.answered_questions(), 'sync', this.render)
    this.listenTo(Codevelop.Collections.questions, 'add', this.render)
    this.question_id = options.question_id
  },

  render: function() {
    var question = Codevelop.Collections.questions.getOrFetch(this.question_id);
    var content = this.template({user: this.model, question: question, answers: question.answerChoices()});
    this.$el.html(content);
    return this;
  },

  submitUserAnswer: function(event){
    event.preventDefault();
    var userAnswer = new Codevelop.Models.UserAnswer()
    var attrs = $(event.currentTarget).serializeJSON()
    userAnswer.save(attrs, {
      success: function () {
        this.render();
      }.bind(this)
    });
    this.question_id++
  },

  skipQuestion: function(event) {
    event.preventDefault();
    var userAnswer = new Codevelop.Models.UserAnswer()
    var question = Codevelop.Collections.questions.getOrFetch(this.question_id, this.render);
    var answer_id = question.answerChoices().pluck("id")[0]
    var attrs = {user_answer: {answer_choice_id: answer_id, explanation:"", weight: 0}}
    userAnswer.save(attrs, {
      success: function() {
        this.render();
      }.bind(this)
    })
    this.question_id++
  }
})
