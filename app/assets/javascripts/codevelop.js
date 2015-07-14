window.Codevelop = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},
  initialize: function() {
    new Codevelop.Routers.Router;
    Backbone.history.start();
  }
};
