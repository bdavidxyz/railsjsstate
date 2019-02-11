class HintsIndex

  def initialize(request, session)
    @request= request
    @session= session
  end

  def call
    current_path = GetCurrentPath.new(@request).call
    pp "ap session[current_path]--------------------------------------------"
    ap @session[current_path]
    model_and_state = _default_model_and_state
    # if _has_unchanged_model?(session)

    return model_and_state
  end

  def _has_unchanged_model?(previous_model)
    # if (session[current_path])
    _default_model_and_state("model")
  end

  def _default_model_and_state
    model = {
      hints: Hint.select(:name, :slug, :description).to_a.map{|e|e.attributes.compact!}
    }
    state = {
      :active_tab => "1st"
    }    
    return {
      model:model,
      state:state
    }
  end

end
