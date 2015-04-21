# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
list1 = List.create(name: "List 1")
list2 = List.create(name: "List 2")
words_list =[
  ["camouflage",
     "something that makes an animal or person or building difficult for enemies to see"],
  ["solemn",
    "formal and dignified"],
  ["grievance",
    "a real or imagined wrong or other cause for complaint or protest, especially unfair treatment"],
  ["anonymous",
    "not identified by name; of unknown name"],
  ["jamboree",
    "a large celebration or party, typically a lavish and boisterous one"],
  ["plausible",
    "seeming reasonable or probable"],
  ["precipitate",
    "to cause (something) to happen quickly or suddenly"]
]

words_list.each do |name, definition|
  Word.create( name: name, definition: definition, list_id: list1.id )
end
