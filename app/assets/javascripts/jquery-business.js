$(function(){

  $(".language-selector").selectmenu();
  var dialog = $( "#dialog-form" ).dialog({
    autoOpen: false,
    height: 360,
    width: 300,
    modal: true,
    position: { my: "center", at: "center top", of: ".language-selection-area"},
    buttons: {
      Submit: function() {
        form.append('<input type="hidden" name="user[language]" value="' + $(".language-selector").val() + '">');
        form.submit();
      },
      Cancel: function() {
        dialog.dialog( "close" );
      }
    },
    close: function() {
      form[ 0 ].reset();
    }
  });

  var form = dialog.find( "form" ).on( "submit", function( event ) {

  });

  $("#continue-button").button().on("click", function() {
    event.preventDefault();
    dialog.dialog("open");
  });

  $(document).mouseup(function (e) {
    var container = $(".ui-dialog");
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      dialog.dialog( "close" )
    }
  });

  if($("#errors").length) {dialog.dialog("open")};
})
