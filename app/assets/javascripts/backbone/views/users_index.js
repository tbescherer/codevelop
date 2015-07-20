Codevelop.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render),
    this.currentUser = options.currentUser
  },

  render: function() {
    var content = this.template({users: this.collection, currentUser: this.currenUser});
    this.$el.html(content)
    return this;
  }
})
