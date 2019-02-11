class HintController < ApplicationController

  def index
    render locals: {
      hints: Hint.all
    }
  end

  def before_unload
    p "-----------------------------------------------------"
    p _params
  end

  def _params
    params.require(:main_store).permit!.to_h
  end

end
