Codevelop.Collections.Questions = Backbone.Collection.extend({
  url: "/api/questions/",

  getOrFetch: function(id) {
    var question = this.get(id);

    if (!question) {
      question = new Codevelop.Models.Question({id: id});
      question.fetch({
        success: function() {
          this.add(question);
        }.bind(this)
      })
    } else {
      question.fetch();
    }
    return question;
  }
})
Codevelop.Collections.questions = new Codevelop.Collections.Questions()
