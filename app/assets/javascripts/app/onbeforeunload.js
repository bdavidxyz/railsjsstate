$(window).unload(function(){
  console.log('Bye.');
  $.ajax({
    type: "POST",
    dataType: "application/json",
    url: "/hint/before_unload",
    headers: {
     'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
    },
    data: {
      main_store: window.main_store
    },
    success: function() {return false},
    error: function() {return false},
  });
//   Rails.ajax({
//   type: "POST", 
//   url: "/hint/before_unload",
//   data: {
//       foo:42
//   },
//   success: function(repsonse){console.log("ok")},
//   error: function(repsonse){console.log("error")}
// })
});
