Codevelop.Routers.Router = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.users = options.users;
  },

  routes: {
    '': 'index',
    'users/:id': 'userShow',
    'profile': "userProfile",
  },

  index: function() {
    this.users.fetch();
    var view = new Codevelop.Views.UsersIndex({
      collection: this.users
    })
    this._swapView(view);
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id)
    console.log("hello from usershow!")
    var view = new Codevelop.Views.UserShow({model: user})
    this._swapView(view);
  },

  userProfile: function() {
    var currentUser = new Codevelop.Models.CurrentUser();
    currentUser.fetch()
    var view = new Codevelop.Views.CurrentUserProfile({model: currentUser})
    this._swapView(view);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }
})
