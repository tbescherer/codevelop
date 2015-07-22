window.Codevelop = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},
  initialize: function() {
    new Codevelop.Routers.Router({$rootEl: $("#main"), users: Codevelop.Collections.users})
    Backbone.history.start();
    Codevelop.Collections.conversations.fetch()
    Codevelop.Models.currentUser.fetch({
      success: function(model) {
        var channel = window.pusher.subscribe('user_' + model.id + '_messages')
        channel.bind('new_message', function(data) {
          Codevelop.Models.currentUser.trigger('incoming_message');
        })
      }
    })

  }
};
