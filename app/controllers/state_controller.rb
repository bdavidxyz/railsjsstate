class StateController < ApplicationController

  def update
    p "-----------------------------------------------------"
    p _params
  end

  def _params
    params.require(:given_object).permit!.to_h
  end

end
