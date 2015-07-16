Codevelop.Routers.Router = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.currentUser = new Codevelop.Models.CurrentUser();
    this.currentUser.fetch()
  },

  routes: {
    '': 'index',
    'users/:id': 'userShow',
    'profile': "userProfile",
    'messages': "userMessages"
  },

  index: function() {
    this.users.fetch();
    var view = new Codevelop.Views.UsersIndex({
      collection: this.users, current_user: this.currentUser
    })
    this._swapView(view);
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id)
    var view = new Codevelop.Views.UserShow({model: user})
    this._swapView(view);
  },

  userProfile: function() {
    var view = new Codevelop.Views.CurrentUserProfile({model: this.currentUser})
    this._swapView(view);
  },

  userMessages: function () {
    var view = new Codevelop.Views.Messages({model: this.currentUser})
    this._swapView(view);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  },


})
