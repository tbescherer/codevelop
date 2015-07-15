Codevelop.Views.QuestionView = Backbone.View.extend({
  template: JST['current_user/questions'],

  events: {
    "submit #user-answer": "submitUserAnswer",
    "click .skip-question": "skipQuestion"
  },

  initialize: function(options) {
    this.question = options.question
    this.listenTo(this.model.answered_questions(), 'sync', this.render)
    this.listenTo(this.question, 'sync', this.render)
  },

  render: function() {
    var content = this.template({user: this.model, question: this.question, answers: this.question.answerChoices()});
    this.$el.html(content);
    return this;
  },

  submitUserAnswer: function(event){
    console.log("You made it!")
    event.preventDefault();
    var userAnswer = new Codevelop.Models.UserAnswer()
    var attrs = $(event.currentTarget).serializeJSON()
    debugger
    userAnswer.save(attrs, {
      success: function () {
        this.render();
      }.bind(this)
    });
  },

  skipQuestion: function(event) {
    event.preventDefault();
    var userAnswer = new Codevelop.Models.UserAnswer()
    var answer_id = this.question.answerChoices().pluck("id")[0]
    var attrs = {user_answer: {answer_choice_id: answer_id, explanation:"", weight: 0}}
    userAnswer.save(attrs, {
      success: function() {
        this.render();
      }.bind(this)
    })
  }
})
