Codevelop.Views.AboutView = Backbone.View.extend({
  template: JST['current_user/about'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
})
