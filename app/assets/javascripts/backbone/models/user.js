Codevelop.Models.User = Backbone.Model.extend({
  urlRoot: '/users/',

  parse: function(response){
    if (response.current_user) {
      Codevelop.Models.current_user = response.current_user
    }
    return response.user;
  }
})
