Codevelop.Views.ConversationShow = Backbone.View.extend({
  template: JST['current_user/conversation_show'],

  className: "conversation-area",

  events: {
    "submit #send-message": "sendMessage",
  },

  initialize: function(options){
    this.currentUser = options.currentUser;
    this.listenTo(this.currentUser, 'incoming_message', this.refresh.bind(this));
    this.listenTo(this.model, 'sync add', this.render);
    this.listenTo(this.model.replies(), 'sync', this.render)
  },

  render: function() {
    if (this.model.get("user_one_id") === this.currentUser.id || this.model.get("user_two_id") === this.currentUser.id) {
      var content = this.template({conversation: this.model, currentUser: this.currentUser});
      this.$el.html(content);
    } else {
      this.$el.html("<div>You don't have permission to read this conversation!</div>")
    }
      return this;
  },

  refresh: function() {
    this.model.fetch();
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
      }.bind(this)
    })
  }
})
