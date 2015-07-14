window.Codevelop = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Mixins: {},
  initialize: function() {
    console.log("hello from backbone!")
    new Codevelop.Routers.Router();
    Backbone.history.start();
  }
};
