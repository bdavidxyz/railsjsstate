class ApplicationController < ActionController::Base
  def hydrate_view(model_and_state)
    gon.model_and_state = model_and_state
    render locals: model_and_state
  end
end
