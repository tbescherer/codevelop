Codevelop.Views.Messages = Backbone.View.extend({
  template: JST['current_user/messages'],

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  }
})
