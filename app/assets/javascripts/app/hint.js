$("document").ready(function(){

  // Apply on JavaScript on the "Hint" page, not the welcome page
  if (window.location.href.indexOf("hint/index") > 0) {

    $(window).unload(function(){
      console.log('Bye.');
      var where = $("body").attr("data-path");
      localStorage.setItem('global_state_for_' + where, JSON.stringify(
        {
          model: gon.model,
          state:  window.main_store.getState(),
        }
      ));
    });

    var default_state = {
      active_tab: "2nd"
    };

    // REDUCER
    var reducer = function(state, action) { 
      if (state === undefined) {
        return default_state;
      }
      // Deep copy of previous state to avoid side-effects
      var newState = JSON.parse(JSON.stringify(state));
      if (action.type === 'INIT') {
        newState.active_tab = default_state.active_tab
      }
      else if (action.type === 'TAB_CLICKED') {
        newState.active_tab = action.with_slug
      }
      return newState;
    };

    // STORE
    window.main_store = Redux.createStore(reducer, default_state);

    // SUBSCRIBER
    var subscriber = function() {

      $(".clickable").removeClass("bold");

      var slug = main_store.getState().active_tab;
      var $elt = $("[data-slug='" + slug + "']");
      $('#text').text($elt .attr("data-description"));
      $elt.addClass("bold");

    };

    main_store.subscribe(subscriber);

    // DISPATCHERS
    $(".clickable").click(function(e) {
      var slug = $(this).attr("data-slug")
      main_store.dispatch({type: 'TAB_CLICKED', with_slug: slug});
    });


  }

});
