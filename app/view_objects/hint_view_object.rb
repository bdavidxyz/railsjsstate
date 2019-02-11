class HintViewObject < ViewObject

  def after_init(args)
    # p '- - - - - - - - - - - - - - args- - - - - - - - - - - - - - - -' 
    # pp args
    # p ''
    @hints = args["model"]["hints"]
    @active_tab_slug = args["state"]["active_tab"]
  end

  def hints
    @hints
  end

  def class_of(hint)
    bolded = is_active_tab?(hint) ? "bold" : ""
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
    "none"
  end

  def is_active_tab?(hint)
    slug_of(hint) == @active_tab_slug
  end

end
