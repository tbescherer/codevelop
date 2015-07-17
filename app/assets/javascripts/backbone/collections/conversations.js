Codevelop.Collections.Conversations = Backbone.Collection.extend({
  url: "/api/conversations/",
  model: Codevelop.Models.Conversation,

  getOrFetch: function(id) {
    var conversation = this.get(id);

    if (!conversation) {
      conversation = new Codevelop.Models.Conversation({id: id});
      conversation.fetch({
        success: function() {
          this.add(conversation);
        }.bind(this)
      })
    } else {
      conversation.fetch();
    }
    return conversation;
  }
})

Codevelop.Collections.conversations = new Codevelop.Collections.Conversations
