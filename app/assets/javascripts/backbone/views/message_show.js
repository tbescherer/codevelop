Codevelop.Views.Messages = Backbone.View.extend({
  template: JST['current_user/messages_show'],

  initialize(options){
    this.current_user = options.current_user
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function() {
    var content = this.template({message: this.model, current_user: this.current_user});
    this.$el.html(content);
    return this;
  }
})
