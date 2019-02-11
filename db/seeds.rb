hint_list = [
  ["first hint",  "This tab actually exist in database"],
  ["second hint",  "This one also exist in database. But there is one thing that do not belongs to database."],
  ["third hint",   "This hint also exist in database, but which tab is active is nowhere in database."],
]

existing_hints = hint.all.map(&:name)

hint_list.each do |name_arg, description_arg|
  unless existing_hints && existing_hints.include?(name_arg)
    hint.create!(name: name_arg, description: description_arg)
  end
end
