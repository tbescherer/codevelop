Codevelop.Views.AboutView = Backbone.View.extend({
  className: "about-section group",
  template: function() {
    if(this.isMe) {
      return JST['current_user/about']
    } else {
      return JST['users/about']
    }
  },

  events: {
    "click #change-self-summary": 'editSummary',
    "click #change-skills": 'editSkill',
    "click #change-message-if": 'editMessageIf',
    "submit form": 'submitThing',
  },

  initialize: function(options) {
    this.isMe = options.isMe
  },

  render: function() {
    var content = this.template()({user: this.model});
    this.$el.html(content);
    return this;
  },

  editSummary: function(event){
    $(event.currentTarget).parent().html('<form class="about-attribute-form group"><label>Self Summary</label><input type="textarea" name="user[about_field_one]" value="' + this.model.escape("about_field_one") + '"><button>Submit</button></form>')
  },

  editSkill: function(event){
    $(event.currentTarget).parent().html('<form class="about-attribute-form group"><label>Skills</label><input type="textarea" name="user[about_field_two]" value="' + this.model.escape("about_field_two") + '"><button>Submit</button></form>')
  },

  editMessageIf: function(event){
    $(event.currentTarget).parent().html('<form class="about-attribute-form group"><label>Message me if</label><input type="textarea" name="user[about_field_three]" value="' + this.model.escape("about_field_three") + '"><button>Submit</button></form>')
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
