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
  },

  findOrCreate: function(user_one_id, user_two_id){
    var convoOne = this.findWhere({user_one_id: user_one_id, user_two_id: user_two_id})
    var convoTwo = this.findWhere({user_one_id: user_two_id, user_two_id: user_one_id})
    var convo = convoOne || convoTwo
    if (!convo) {
      convo = new Codevelop.Models.Conversation({user_one_id: user_one_id, user_two_id: user_two_id})
      convo.save({}, {
        success: function(model) {
          Codevelop.Collections.conversations.add(model)
          Backbone.history.navigate("#/messages/" + model.id, {trigger: true})
        },
      })
    } else {
      convo.fetch({
        success: function(model) {
          Backbone.history.navigate("#/messages/" + model.id, {trigger: true})
        }
      });
    }
    return convo;
  }
});
Codevelop.Collections.conversations = new Codevelop.Collections.Conversations
