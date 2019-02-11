hint_list = [
  ["1st", "first hint",  "This tab actually exist in database"],
  ["2nd", "second hint",  "This one also exist in database. But there is one thing that do not belongs to database."],
  ["3rd",   "This hint also exist in database, but which tab is active is nowhere in database."],
]

existing_hints = Hint.all.map(&:name)

hint_list.each do |slug_arg, name_arg, description_arg|
  unless existing_hints && existing_hints.include?(name_arg)
    Hint.create!(slug: slug_arg, name: name_arg, description: description_arg)
  end
end
