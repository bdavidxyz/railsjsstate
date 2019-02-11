$("document").ready(function(){

  // Apply on JavaScript on the "Hint" page, not the welcome page
  if (window.location.href.indexOf("hint/index") > 0) {

    var default_state = {
      active_tab: 0
    };

    var reducer = function(state, action) {  
      if (state === undefined) {
      }
      // Deep copy of previous state to avoid side-effects
      var newState = JSON.parse(JSON.stringify(state));
      if (action.type === 'INIT') {
      }
      else if (action.type === 'RESIZE_WINDOW') {
      }
      return newState;
    };

    window.main_store = Redux.createStore(reducer, default_state);

    var subscriber = function() {
      var state = main_store.getState();
    }

    main_store.subscribe(subscriber);


    console.log("hey")

  }

});
