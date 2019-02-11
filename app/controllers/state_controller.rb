class StateController < ApplicationController

  def create
    given_object = _params
    session[given_object["path"]] = YAML.load(given_object["model_and_state"])
    p '- - - - - - - - - - - - - - session- - - - - - - - - - - - - - - -' 
    pp given_object["path"]
    pp session[given_object["path"]]
    p ''
  end

  def _params
    params.require(:given_object).permit!.to_h
  end

end
