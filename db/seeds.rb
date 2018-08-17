# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name: 'User', email: 'user@user.com', password: 123456)
# User.create!(name: 'John', email: 'john@user.com', password: 123456)
# User.create!(name: 'Mary', email: 'mary@user.com', password: 123456)
# User.create!(name: 'Ann', email: 'ann@user.com', password: 123456)
# User.create!(name: 'Will', email: 'will@user.com', password: 123456)


# Scooter.create!(name: 'Vezpa', description: 'Mean Vezpa', user: User.first)
# Scooter.create!(name: 'Beoncy', description: 'Fast as hell', user: User.second)
# Scooter.create!(name: 'Bizoo', description: 'Killer speed', user: User.third)
# Scooter.create!(name: 'Belha', description: 'Chilling on the way', user: User.fourth)
# Scooter.create!(name: 'Fierce', description: 'Enjoy the ride', user: User.fifth)
User.destroy_all
Scooter.destroy_all


address = [
  'Rua Visconde de Pirajá 444, Ipanema, Rio de Janeiro',
  'Rua Redentor 40, Ipanema, Rio de Janeiro',
  'Rua Barata Ribeiro 22, Copacabana, Rio de Janeiro',
  'Rua Maria Quitéria 200, Ipanema, Rio de Janeiro',
  'Rua Alberto de Campos 176, Ipanema, Rio de Janeiro',
  'Rua Santa Clara 303, Copacabana, Rio de Janeiro',
  'Rua Visconde de Pirajá 150, Ipanema, Rio de Janeiro',
  'Rua Visconde de Pirajá 175, Ipanema, Rio de Janeiro',
  'Rua Dois de Dezembro, Flamengo, Rio de Janeiro',

]


# How Eric populated my user seed
5.times do |t|
  user = User.create(email: Faker::Internet.email, password: 123456)
end

user = User.create!(email: "owner@gmail.com", password: 123456)
24.times do
  user.scooters.create!({
    name: Faker::GameOfThrones.character,
    description: Faker::GameOfThrones.quote,
    remote_picture_url: "https://picsum.photos/200/300/?random",
    address: address.sample
  })
end
