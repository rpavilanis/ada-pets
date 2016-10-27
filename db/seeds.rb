# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pets = [
  {
    name: "Peanut",
    age: 2,
    human: "Ada"
  },
  {
    name: "Horsetooth",
    age: 14,
    human: "Grace"
  },
  {
    name: "Beansprout",
    age: 1,
    human: "Katherine"
  }
]

pets.each do |pet|
  Pet.create(pet)
end
