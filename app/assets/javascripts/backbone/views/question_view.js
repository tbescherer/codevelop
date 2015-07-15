Codevelop.Views.QuestionView = Backbone.View.extend({
  template: JST['current_user/questions'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
})
