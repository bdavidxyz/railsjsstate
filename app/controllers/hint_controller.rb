class HintController < ApplicationController

  def index
    current_path = GetCurrentPath.new(request).call
    pp "ap session[current_path]--------------------------------------------"
    ap session[current_path]
    model = {
      hints: Hint.select(:name, :slug, :description).to_a.map{|e|e.attributes.compact!}
    }
    hydrate_view(model)
  end

end
