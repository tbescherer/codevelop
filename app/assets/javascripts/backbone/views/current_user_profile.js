Codevelop.Views.CurrentUserProfile = Backbone.CompositeView.extend({
  className: "group",
  template: JST['current_user/show'],

  events: {
    "click #about-button": "aboutView",
    "click #question-button": "questionView"
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    this.aboutView();
    return this;
  },

  aboutView: function() {
    console.log("hello from aboutview");
    var view = new Codevelop.Views.AboutView({model: this.model})
    this.$el.find(".content-tabs").html(view.render().$el)
  },

  questionView: function() {
    console.log("hello from questionView")
    var q_id_arr = this.model.answered_questions().pluck("question_id");
    var q_id = q_id_arr[q_id_arr.length-1] + 1;
    var question = Codevelop.Collections.questions.getOrFetch(q_id);
    debugger
    var view = new Codevelop.Views.QuestionView({model: this.model, question: question})
    this.$el.find(".content-tabs").html(view.render().$el)
  },
})
