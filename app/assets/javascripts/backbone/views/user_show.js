Codevelop.Views.UserShow = Backbone.View.extend({
  className: "group profile",
  template: JST['users/show'],

  events: {
    "click #about-button": "aboutView",
    "click #photo-button": "pictureView",
    "click #start-convo": "startConvo"
  },

  initialize: function(options) {
    this.listenTo(this.model.answered_questions(), 'sync', this.render)
    this.listenTo(Codevelop.Collections.questions, 'add', this.render)
    this.question_id = options.question_id
  },

  initialize: function(options) {
    this.currentUser = options.currentUser
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    this.aboutView();
    return this;
  },

  aboutView: function() {
    var view = new Codevelop.Views.AboutView({model: this.model, isMe: false})
    this.$el.find(".content-tabs").html(view.render().$el)
  },

  pictureView: function() {
    var view = new Codevelop.Views.PhotoView({model: this.model})
    this.$el.find(".content-tabs").html(view.render().$el)
  },

  startConvo: function() {
    var conversation = Codevelop.Collections.conversations.findOrCreate(this.currentUser.id, this.model.id)
  }
})
