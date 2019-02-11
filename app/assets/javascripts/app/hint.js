$("document").ready(function(){

  // Apply on JavaScript on the "Hint" page, not the welcome page
  if (window.location.href.indexOf("hint/index") > 0) {


    // REDUCER
    var reducer = function(state, action) { 

      // Deep copy of previous state to avoid side-effects
      var newState = deep_copy_of(state);

      if (action.type === 'TAB_CLICKED') {
        newState.active_tab = action.with_slug
      }

      // BOOM ! save current state
      post_new_state_to_server(newState);

      return newState;
    };

    // STORE
    window.main_store = Redux.createStore(reducer, gon.model_and_state.state);

    // SUBSCRIBER
    var active_tab_watcher = Redux.watch(main_store.getState, 'active_tab')(function(newVal, oldVal, objectPath) {
      console.log('%s changed from %s to %s', objectPath, oldVal, newVal)
      $(".clickable").removeClass("bold");

      var slug = main_store.getState().active_tab;
      var $elt = $("[data-slug='" + slug + "']");
      $('#text').text(gon.model_and_state.model["hints"].find(function(e){return e.slug === slug})["description"]);
      $elt.addClass("bold");
    })

    main_store.subscribe(active_tab_watcher);

    // DISPATCHERS
    $(".clickable").click(function(e) {
      var slug = $(this).attr("data-slug")
      main_store.dispatch({type: 'TAB_CLICKED', with_slug: slug});
    });


  }

});
