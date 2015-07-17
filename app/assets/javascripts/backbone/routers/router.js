Codevelop.Routers.Router = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.conversations = Codevelop.Collections.conversations
    this.conversations.fetch()
    this.currentUser = new Codevelop.Models.CurrentUser();
    this.currentUser.fetch()
  },

  routes: {
    '': 'index',
    'users/:id': 'userShow',
    'profile': "userProfile",
    'messages': "conversationIndex",
    'messages/:id': "conversationShow"
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
    var view = new Codevelop.Views.UserShow({model: user, current_user: this.currentUser})
    this._swapView(view);
  },

  userProfile: function() {
    var view = new Codevelop.Views.CurrentUserProfile({model: this.currentUser})
    this._swapView(view);
  },

  conversationIndex: function () {
    var view = new Codevelop.Views.ConversationIndex({model: this.currentUser, conversations: this.conversations})
    this._swapView(view);
  },

  conversationShow: function (id) {
    var conversation = this.conversations.getOrFetch(id);
    var view = new Codevelop.Views.ConversationShow({model: conversation, current_user: this.currentUser})
    this._swapView(view);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  },


})
