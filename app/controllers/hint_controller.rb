class HintController < ApplicationController

  def index
    # previous_model = 
    # current_model = 
    model = {
      hints: Hint.select(:name, :slug, :description)
    }
    hydrate_view(model)
  end

  def before_unload
    p "-----------------------------------------------------"
    p _params
  end

  def _params
    params.require(:main_store).permit!.to_h
  end

end
