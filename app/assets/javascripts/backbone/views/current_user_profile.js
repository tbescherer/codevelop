Codevelop.Views.CurrentUserProfile = Backbone.CompositeView.extend({
  className: "group",
  template: JST['current_user/show'],

  events: {
    "click #about-button": "aboutView",
    "click #question-button": "questionView",
    "change #input-user-avatar": "uploadPhoto"
  },

  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    this.aboutView();
    return this;
  },

  aboutView: function() {
    var view = new Codevelop.Views.AboutView({model: this.model})
    this.$el.find(".content-tabs").html(view.render().$el)
  },

  questionView: function() {
    var q_id_arr = this.model.answered_questions().pluck("question_id");
    var q_id = q_id_arr[q_id_arr.length-1] + 1 || 1
    var view = new Codevelop.Views.QuestionView({model: this.model, question_id: q_id})
    this.$el.find(".content-tabs").html(view.render().$el)
  },

  uploadPhoto: function(){
    var file = this.$("#input-user-avatar")[0].files[0];

    var formData = new FormData();
    formData.append("user[avatar]", file);
    var self = this;
    this.model.saveFormData(formData, {
      success: function(){
        Backbone.history.navigate("#/profile", {trigger: true});
      }
    });
  }
})
