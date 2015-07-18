Codevelop.Views.ConversationIndex = Backbone.View.extend({
  template: JST['current_user/conversation_index'],

  initialize: function(options) {
    this.conversations = options.conversations
    this.listenTo(this.conversations, 'sync', this.render)
  },

  render: function() {
    var content = this.template({user: this.model, conversations: this.conversations});
    this.$el.html(content);
    return this;
  }
})
