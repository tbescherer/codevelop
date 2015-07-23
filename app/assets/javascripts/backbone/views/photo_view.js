Codevelop.Views.PhotoView = Backbone.View.extend({
  template: JST['users/questions'],

  className: "question-overview",

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  }
})
