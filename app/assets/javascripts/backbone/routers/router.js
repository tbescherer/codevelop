Codevelop.Routers.Router = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl
    this.users = options.users
  },

  routes: {
    '': 'index',
  },

  index: function() {
    this.users.fetch();
    var view = new Codevelop.Views.UsersIndex({
      collection: this.users
    })
    console.log("index called");
    this._swapView(view);
  },


  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
})
