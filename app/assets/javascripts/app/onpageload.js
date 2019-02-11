$("document").ready(function(){


  var key_val = localStorage_has_key_starting_with("global_state_for_");
  console.log("key_val");
  console.log(key_val);

  if (key_val) {
    $.ajax({
      type: "POST",
      dataType: "application/json",
      url: "/state/create",
      headers: {
       'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      data: {
        given_object: {
          path: key_val.key.substring("global_state_for_".length),
          model_and_state: key_val.value
        }
      },
      success: function() {
        localStorage.removeItem(key_val.key);
      },
      error: function() {return false},
    });
  }


});
