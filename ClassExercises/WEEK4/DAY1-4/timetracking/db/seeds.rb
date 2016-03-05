# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Project.create name: 'Ironhack', description: 'Ironhack is a ....'
# Project.create name: 'Time tracking app'
# Project.create name: 'Recipes', description: 'Track my favourite recipes'

#25.times {|x| Project.create name: "Project #{x}", description: "Description #{x}"}

25.times do |x|
  p=Project.create name: "Project #{x}", description: "Description #{x}"

  p.entries.create(
  date:Date.today-rand(10).days,
  hours:rand(24),
  minutes: rand(60))
end
