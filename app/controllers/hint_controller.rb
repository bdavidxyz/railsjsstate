class HintController < ApplicationController

  def index
    hydrate_view(HintsIndex.new(request, session).call)
  end

end
