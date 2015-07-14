Codevelop.Routers.Router = Backbone.Router.extend({
  routes: {
    '': 'index',
  },

  index: function() {
    console.log("index called");
  }
})
