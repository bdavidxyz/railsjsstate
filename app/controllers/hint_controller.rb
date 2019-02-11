class HintController < ApplicationController

  def index
    current_path = GetCurrentPath.new(request).call
    model = {
      hints: Hint.select(:name, :slug, :description)
    }
    hydrate_view(model)
  end

end
