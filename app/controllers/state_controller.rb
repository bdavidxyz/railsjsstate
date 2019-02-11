class StateController < ApplicationController

  def create
    given_object = _params
    # p '- - - - - - - - - - - - - - _params- - - - - - - - - - - - - - - -' 
    # ap _params
    # p ''
    session[given_object["path"]] = YAML.load(given_object["model_and_state"])
  end

  def _params
    params.require(:given_object).permit!.to_h
  end

end
