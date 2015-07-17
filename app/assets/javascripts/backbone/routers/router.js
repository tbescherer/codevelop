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
    'messages': "userMessages",
    'messages/:id': "userMessageShow"
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
    var messages = new Codevelop.Collections.Conversations()
    messages.fetch()
    var view = new Codevelop.Views.Messages({model: this.currentUser, conversations: messages})
    this._swapView(view);
  },

  userMessageShow: function (id) {
    var messages = new Codevelop.Models.Conversation({id: id})
    message.fetch()
    var view = new Codevelop.Views.MessageShow({model: messages, current_user: this.current_user})
    this._swapView(view);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  },


})
