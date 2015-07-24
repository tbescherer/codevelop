Codevelop.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  className: "users-index",

  events: {
    "change .query": "search",
    "click .test-button": "userShowModal",
  },

  initialize: function(options) {
    this.listenTo(this.collection, 'update', this.render),
    this.currentUser = options.currentUser
    this.collection.pageNum = 1;
  },

  render: function() {
    var content = this.template({users: this.collection, currentUser: this.currentUser});
    this.$el.html(content)
    this.listenForScroll();
    console.log("render")
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
        $("#loading-message").html('<p>Loading more matches...</p>')
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
  },

  userShowModal: function(event) {
    event.preventDefault();
    var user_id = $(event.currentTarget).data("userId");
    $("body").css("overflow", "hidden")
    var user = this.collection.getOrFetch(user_id);
    var modal = new Codevelop.Views.UserModal({model: user, currentUser: this.currentUser})
    var content = modal.render().$el
    $(".backdrop").prepend(content)
    window.setTimeout(function(){
      $(".modal-profile").css("right", "0px")
      $("#left-scrim").css("opacity", "0.6")
    }, 10)

  }
})
