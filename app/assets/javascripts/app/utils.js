function post_new_state_to_server(newState) {  
  $.ajax({
    type: "POST",
    dataType: "application/json",
    url: "/state/create",
    headers: {
     'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
    },
    data: {
      given_object: {
        path: $("body").attr("data-path"),
        model_and_state: JSON.stringify({
          model: gon.model_and_state["model"],
          state: newState
        })
      }
    },
    success: function() {return false},
    error: function() {return false},
  });
}

function deep_copy_of(obj) {
  return JSON.parse(JSON.stringify(obj));
}
