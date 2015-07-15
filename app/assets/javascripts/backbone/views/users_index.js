Codevelop.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render),
    this.current_user = options.current_user
  },

  render: function() {
    var content = this.template({users: this.collection, current_user: this.current_user});
    this.$el.html(content)
    return this;
  }
})
