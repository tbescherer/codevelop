Codevelop.Views.CurrentUserProfile = Backbone.View.extend({
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
    this.$el.find(".content-tabs").append("about")
  },

  questionView: function() {
    console.log("hello from questionView")
    this.$el.find(".content-tabs").append("question")
  }
})
