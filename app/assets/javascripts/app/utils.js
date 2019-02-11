
  var localStorage_has_key_starting_with = function(val) {
    var result = false;
    for ( var i = 0, len = localStorage.length; i < len; ++i ) {
      var current_key = localStorage.key(i);
      if (current_key) {
        if (current_key.indexOf(val) === 0) {
          result = {
            key:  current_key,
            value: localStorage.getItem(current_key)
          };
        }
      }
    }
    return result;
  };

