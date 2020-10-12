# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

begin
  10.times do
    Catalog.create({title: Faker::Book.genre})
  end
end

begin
  60.times do
    Movie.create({name: Faker::Movie.title, catalog_id: rand(1..10)})
  end
end
