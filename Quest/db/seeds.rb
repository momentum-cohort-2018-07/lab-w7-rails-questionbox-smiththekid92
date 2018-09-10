# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Question.delete_all 
User.delete_all

300.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.free_email, 
    password: Faker::Internet.password(8)
  )
end

user_ids = User.pluck(:id)

500.times do
  Question.create(
    title: Faker::ProgrammingLanguage.name,
    body: Faker::GreekPhilosophers.quote,
    user: User.find(user_ids.sample)
  )
end