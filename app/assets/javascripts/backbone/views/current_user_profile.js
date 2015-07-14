Codevelop.Views.CurrentUserProfile = Backbone.View.extend({
  template: JST['current_user/show'],

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  }
})
