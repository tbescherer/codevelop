Codevelop.Models.Conversation = Backbone.Model.extend({
  urlRoot: '/api/conversations/',

  parse: function(response){
    if (response.replies) {
      this.replies().set(response.replies, { parse: true});
    }
    return response;
  },

  replies: function() {
    if (!this._replies) {
      this._replies = new Codevelop.Collections.ConversationReplies([], {conversation: this})
    }

    return this._replies;
  },
});
