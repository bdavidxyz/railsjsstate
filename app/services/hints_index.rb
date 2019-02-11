class HintsIndex

  def initialize(request, session)
    @request= request
    @session= session
  end

  def call
    model_and_state = _current
    if model_and_state["model"] == _previous["model"]
      model_and_state = _previous
    end
    return model_and_state
  end


  def _previous
    current_path = GetCurrentPath.new(@request).call
    @session[current_path] ? @session[current_path] : {}
  end

  def _current
    return {
      "model" => {
        "hints" => Hint.select(:name, :slug, :description).to_a.map{|e|e.attributes.compact!}
      },
      "state" => {
        "active_tab" => "1st"
      }
    }
  end

end
