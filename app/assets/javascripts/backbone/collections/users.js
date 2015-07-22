Codevelop.Collections.Users = Backbone.Collection.extend({
  url: "/api/users/",
  model: Codevelop.Models.User,

  comparator: function(thing) {
    return -thing.get("match_score");
  },

  parse: function(response) {
    if (response.totalPages) {
      this.totalPages = response.totalPages;
    }
    return response.users;
  },

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
