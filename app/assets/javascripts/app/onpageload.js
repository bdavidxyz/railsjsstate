$("document").ready(function(){

  console.log(localStorage_has_key_starting_with("global_state_for_"));

  var key_val = localStorage_has_key_starting_with("global_state_for_");

  if (key_val) {
    var path = key_val.key.substring("global_state_for_".length);
    var model_and_state = JSON.parse(key_val.value);
    $.ajax({
      type: "PUT",
      dataType: "application/json",
      url: "/state/update",
      headers: {
       'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      data: {
        given_object: {
          path: path,
          model_and_state: model_and_state
        }
      },
      success: function() {
        localStorage.removeItem(key_val.key);
      },
      error: function() {return false},
    });
  }


});
