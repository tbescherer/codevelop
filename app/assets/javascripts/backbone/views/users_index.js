Codevelop.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  events: {
    "change .query": "search",
    "click .next-page": "nextPage",
    "click .prev-page": "prevPage"
  },

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render),
    this.currentUser = options.currentUser
    this.collection.pageNum = 1;
  },

  render: function() {
    var content = this.template({users: this.collection, currentUser: this.currentUser});
    this.$el.html(content)
    return this;
  },

  search: function(event) {
    event.preventDefault();
    this.collection.pageNum = 1;
    this.collection.query = this.$(".query").val();
    this.collection.fetch({
      data: {
        query: this.collection.query,
        page: this.collection.pageNum
      }
    });
  },

  nextPage: function (event) {
    this.collection.fetch({
      data: {
        query: this.collection.query,
        page: this.collection.pageNum + 1
      },
      success: function() {
        this.collection.pageNum++
      }.bind(this)
    });
  },

  prevPage: function (event) {
    this.collection.fetch({
      data: {
        query: this.collection.query,
        page: this.collection.pageNum - 1
      },
      success: function() {
        this.collection.pageNum--
      }.bind(this)
    });
  }
})
