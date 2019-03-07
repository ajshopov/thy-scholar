# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: 'admin@thyscholar.com')
  User.create!(email: 'admin@thyscholar.com', name: 'Admin', password: 'password')
end

unless User.exists?(email: 'alexanderjshopov@gmail.com')
  User.create!(email: 'admin@thyscholar.com', name: 'Alex Shopov', password: 'password')
end

# create random users
10.times do
  User.create(
    email: Faker::Internet.unique.safe_email,
    name: Faker::Name.name, 
    password: 'password'
  )
end

# create questions with answers
10.times do
  q = Question.create!(query: Faker::Quotes::Shakespeare.hamlet,
    sender: User.find_by(email: "admin@thyscholar.com"),
    recipient: User.find(rand(2..User.last.id)),
    state: 'pending', price: rand(1..20))
  q.answer = Answer.new(user_id: q.recipient_id,
    response: Faker::Quote.most_interesting_man_in_the_world << ' ' << Faker::Lorem.paragraph(10))
  q.answer.save!
end

#create unanswered questions
10.times do
  q = Question.create!(query: Faker::Quotes::Shakespeare.hamlet,
    sender: User.find_by(email: "admin@thyscholar.com"),
    recipient: User.find(rand(2..User.last.id)),
    state: 'pending', price: rand(1..20))
end