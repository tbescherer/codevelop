window.Codevelop = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},
  initialize: function() {
    console.log("hello from backbone!")
    new Codevelop.Routers.Router({$rootEl: $("#main"), users: Codevelop.Collections.users})
    Backbone.history.start();
  }
};
