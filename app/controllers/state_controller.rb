class StateController < ApplicationController

  def update
    given_object = _params
    p '- - - - - - - - - - - - - - given_object- - - - - - - - - - - - - - - -' 
    pp given_object
    p ''
    session[given_object["path"]] = given_object["model_and_state"]
  end

  def _params
    params.require(:given_object).permit!.to_h
  end

end
