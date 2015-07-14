Codevelop.Collections.Users = Backbone.Collection.extend({
  url: "/users/",

  getOrFetch: function(id) {
    var user = this.get(id);
    var users = this;
    if (!user) {
      user = new Codevelop.Models.User({id: id})
      user.fetch({
        success: function() {
          this.add(user);
        }.bind(this)
      });
    } else {
      user.fetch();
    }
    return user;
  }
})

Codevelop.Collections.users = new Codevelop.Collections.Users
