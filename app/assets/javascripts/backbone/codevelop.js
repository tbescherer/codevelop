window.Codevelop = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},
  initialize: function() {
    new Codevelop.Routers.Router({$rootEl: $("#main"), users: Codevelop.Collections.users})
    Backbone.history.start();
  }
};
