Codevelop.Views.ConversationShow = Backbone.View.extend({
  template: JST['current_user/conversation_show'],

  events: {
    "submit #send-message": "sendMessage",
  },

  initialize: function(options){
    this.currentUser = options.currentUser
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function() {
    var content = this.template({conversation: this.model, currentUser: this.currentUser});
    this.$el.html(content);
    return this;
  },

  sendMessage: function(event){
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON()["conversation_reply"];
    attrs.conv_id = this.model.id
    attrs.user = {username: this.currentUser.get("username")}
    var message = new Codevelop.Models.ConversationReply();
    message.save(attrs, {
      success: function(model){
        this.model.replies().add(message)
        this.render();
      }.bind(this)
    })
  }
})
