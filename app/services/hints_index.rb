class HintsIndex

  def initialize(request, session)
    @request= request
    @session= session
  end

  def call
    current_path = GetCurrentPath.new(@request).call
    pp "ap session[current_path]--------------------------------------------"
    ap @session[current_path]
    model = {
      hints: Hint.select(:name, :slug, :description).to_a.map{|e|e.attributes.compact!}
    }
    state = {
      :active_tab => "1st"
    }
    return {
      model: model,
      state: state
    }
  end

end
