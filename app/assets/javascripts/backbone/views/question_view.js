Codevelop.Views.QuestionView = Backbone.View.extend({
  template: JST['current_user/questions'],

  initialize: function(options) {
    this.question = options.question
    this.listenTo(this.model.answered_questions(), 'sync', this.render)
    this.listenTo(this.question, 'sync', this.render)
  },

  render: function() {
    var content = this.template({user: this.model, question: this.question});
    debugger
    this.$el.html(content);
    console.log("rendering")
    return this;
  }
})
