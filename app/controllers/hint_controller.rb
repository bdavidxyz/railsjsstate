class HintController < ApplicationController

  def index
    render locals: {
      hints: Hint.all
    }
  end

end
