Codevelop.Views.CurrentUserProfile = Backbone.CompositeView.extend({
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
    return this;
  },

  aboutView: function() {
    console.log("hello from aboutview");
    var view = new Codevelop.Views.AboutView({user: this.model})
    this.$el.find(".content-tabs").html(view.render().$el)
  },

  questionView: function() {
    console.log("hello from questionView")
    var view = new Codevelop.Views.QuestionView({user: this.model})
    this.$el.find(".content-tabs").html(view.render().$el)
  },
})
