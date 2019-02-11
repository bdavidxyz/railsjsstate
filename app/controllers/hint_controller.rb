class HintController < ApplicationController

  def index
    current_path = GetCurrentPath.new(request).call
    pp "ap session[current_path]--------------------------------------------"
    ap session[current_path]
    model = {
      hints: Hint.select(:name, :slug, :description).to_a.map{|e|e.attributes.compact!}
    }
    state = {
      :active_tab => "1st"
    }
    hydrate_view({
      model: model,
      state: state
    })
  end

end
