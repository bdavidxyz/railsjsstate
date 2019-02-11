class ApplicationController < ActionController::Base
  def hydrate_view(model_and_state)
    symbolized_model_and_state = model_and_state.deep_transform_keys(&:to_s)
    gon.model_and_state = symbolized_model_and_state
    render locals: symbolized_model_and_state
  end
end
