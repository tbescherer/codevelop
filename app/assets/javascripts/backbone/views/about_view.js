Codevelop.Views.AboutView = Backbone.View.extend({
  template: JST['current_user/about'],

  events: {
    "click #change-self-summary #change-skills #change-message-if": 'editSummary'
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },

  editSummary: function(event){
    $(event.currentTarget).html("hello!");
  }
})
