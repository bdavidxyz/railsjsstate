class HintViewObject < ViewObject

  def after_init(args)
    p '- - - - - - - - - - - - - - args- - - - - - - - - - - - - - - -' 
    pp args
    p ''
    @hints = args["model"]["hints"]
    @active_tab_slug = args["state"]["active_tab"]
    @active_tab_slug = "1st" if @active_tab_slug == nil
  end

  def hints
    @hints
  end

  def class_of(hint)
    bolded = _is_active_tab?(hint) ? "bold" : ""
    "clickable #{bolded}"
  end

  def description_of(hint)
    hint["description"]
  end

  def slug_of(hint)
    hint["slug"]
  end

  def name_of(hint)
    hint["name"]
  end

  def displayed_text
    active_hint = @hints.find { |hint| hint["slug"] == @active_tab_slug  }
    p '- - - - - - - - - - - - - - @hints- - - - - - - - - - - - - - - -' 
    pp @active_tab_slug 
    pp @hints
    p ''
    active_hint["description"]
  end

  def _is_active_tab?(hint)
    slug_of(hint) == @active_tab_slug
  end

end
