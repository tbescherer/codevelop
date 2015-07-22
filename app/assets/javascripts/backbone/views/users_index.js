Codevelop.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  events: {
    "change .query": "search",
  },

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render),
    this.currentUser = options.currentUser
    this.collection.pageNum = 1;
  },

  render: function() {
    var content = this.template({users: this.collection, currentUser: this.currentUser});
    this.$el.html(content)
    this.listenForScroll();
    return this;
  },

  search: function(event) {
    console.log("fire!");
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
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      if (this.collection.pageNum < this.collection.totalPages) {
        this.collection.fetch({
          data: {
            query: this.collection.query,
            page: this.collection.pageNum + 1
          },
          success: function() {
            this.collection.pageNum++
          }.bind(this),
          remove: false
        });
      }
    }
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
  },

  listenForScroll: function() {
    $(window).off("scroll");
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
    $(window).on("scroll", throttledCallback);
  }
})
