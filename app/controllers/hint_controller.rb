class HintController < ApplicationController

  def index
    current_path = GetCurrentPath.new(request).call
    p '- - - - - - - - - - - - - - session_current_path- - - - - - - - - - - - - - - -' 
    pp session[current_path]
    p ''
    model = {
      hints: Hint.select(:name, :slug, :description).to_a.map{|e|e.attributes.compact!}
    }
    hydrate_view(model)
  end

end
