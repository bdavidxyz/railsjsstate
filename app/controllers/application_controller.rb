class ApplicationController < ActionController::Base
  def hydrate_view(model)
    gon.model = model
    render locals: model
  end
end
