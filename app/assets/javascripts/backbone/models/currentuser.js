Codevelop.Models.CurrentUser = Codevelop.Models.User.extend({
  urlRoot: '/api/current_user',

  saveFormData: function(formData, options){
    var model = this;

    $.ajax({
      url: _.result(model, "url"),
      type: "PUT",
      data: formData,
      processData: false,
      contentType: false,
      success: function(resp){
        model.set(model.parse(resp));
        model.trigger('sync', model, resp, options);
        options.success && options.success(model, resp, options);
      },
      error: function(resp) {
        options.error && options.error(model, resp, options);
      }
    });
  }
});
