Codevelop.Views.CurrentUserProfile = Backbone.CompositeView.extend({
  className: "group profile",
  template: JST['current_user/show'],

  events: {
    "click #about-button": "aboutView",
    "click #question-button": "questionView",
    "change #input-user-avatar": "uploadPhoto",
    "click #change-age": "editAge",
    "click #change-job": "editJob",
    "click #change-looking": "editLooking",
    "submit .detail-form": "submitThing"
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
    var view = new Codevelop.Views.AboutView({model: this.model, isMe: true})
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
  },

  editJob: function(event) {
    $(event.currentTarget).parent().html('<form class="detail-form"><input type="text" name="user[job]" value="' + this.model.escape("job") + '"><button>Submit</button></form>')
  },

  editAge: function(event) {
    $(event.currentTarget).parent().html('<form class="detail-form"><input type="text" name="user[age]" value="' + this.model.escape("age") + '"><button>Submit</button></form>')
  },

  editLooking: function(event) {
    $(event.currentTarget).parent().html('<form class="detail-form"><input type="text" name="user[looking_for]" value="' + this.model.escape("looking_for") + '"><button>Submit</button></form>')
  },

  submitThing: function(event){
    event.preventDefault();
    var formData = new FormData(event.currentTarget);
    this.model.saveFormData(formData, {
      success: function(){
        Backbone.history.navigate("#/profile", {trigger: true});
      }
    });
  }
})
