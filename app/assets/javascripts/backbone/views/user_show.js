Codevelop.Views.UserShow = Backbone.View.extend({
  className: "group profile",
  template: JST['users/show'],

  events: {
    "click #about-button": "aboutView",
    "click #photo-button": "pictureView",
    "click #start-convo": "startConvo"
  },

  initialize: function(options) {
    this.currentUser = options.currentUser
    this.listenTo(this.currentUser, 'sync', this.render)
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({user: this.model, currentUser: this.currentUser});
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
