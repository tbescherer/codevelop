Codevelop.Collections.Conversations = Backbone.Collection.extend({
  url: "/api/conversations/",

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
