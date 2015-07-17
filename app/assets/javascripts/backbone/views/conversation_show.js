Codevelop.Views.ConversationShow = Backbone.View.extend({
  template: JST['current_user/conversation_show'],

  events: {
    "submit #send-message": "sendMessage",
  },

  initialize(options){
    this.current_user = options.current_user
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function() {
    var content = this.template({message: this.model, current_user: this.current_user});
    this.$el.html(content);
    return this;
  },

  sendMessage: function(event){
    console.log("sending message")
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON();
    attrs.conversation_reply.conv_id = this.model.id
    var message = new Codevelop.Models.ConversationReply();
    message.save(attrs, {
      success: function(model){
        this.render();
      }.bind(this)
    })
  }
})
