Codevelop.Views.UserModal = Backbone.View.extend({
  className: "group modal-view",
  template: JST['users/modal'],

  events: {
    "click #modal-start-convo": "startConvo",
    "click #left-scrim": "killScrim",
    "click .modal-profile-button": "mitigateScrim"
  },

  initialize: function(options) {
    this.currentUser = options.currentUser;
  },

  render: function() {
    var content = this.template({user: this.model, currentUser: this.currentUser});
    this.$el.html(content);
    return this;
  },

  mitigateScrim: function() {
    $(".modal-view").remove()
    $("body").css("overflow", "visible")
  },

  startConvo: function() {
    $(".modal-view").remove()
    $("body").css("overflow", "visible")
    var conversation = Codevelop.Collections.conversations.findOrCreate(this.currentUser.id, this.model.id)
  },

  killScrim: function() {
    $("body").css("overflow", "visible")
    $(".modal-profile").css("right", "-500px")
    $("#left-scrim").css("width", "100%")
    $("#left-scrim").css("opacity", "0.0")
    window.setTimeout(function(){$(".modal-view").remove()}, 500)
  }
})
