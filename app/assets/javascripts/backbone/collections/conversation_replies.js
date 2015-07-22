Codevelop.Collections.ConversationReplies = Backbone.Collection.extend({
  url: '/api/conversation_replies/',

  comparator: function(reply) {
    return reply.get("created_at")
  }
})
