# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = []
30.times do
  users << User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: "password",
  language: Faker::Hacker.noun,
  about_field_one: Faker::Hacker.say_something_smart,
  about_field_two: Faker::Hacker.say_something_smart,
  about_field_three: Faker::Hacker.say_something_smart,
  job: "Dev at #{Faker::App.name}",
  age: Faker::Number.number(2),
  looking_for: Faker::Hacker.noun,
  avatar: Faker::Avatar.image
  )
end

User.create(
  username: "guest_user",
  email: "guest@example.com",
  password: "password",
  language: Faker::Hacker.noun,
  about_field_one: Faker::Hacker.say_something_smart,
  about_field_two: Faker::Hacker.say_something_smart,
  about_field_three: Faker::Hacker.say_something_smart,
  job: "Dev at #{Faker::App.name}",
  age: Faker::Number.number(2),
  looking_for: Faker::Hacker.noun,
  avatar: Faker::Avatar.image
)

choices = ["Yes", "No", "Now and Again"]
20.times do |i|
  options = []
  text = "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}. Yes or no?"
  question = Question.create(body: text)
  options << question.answer_choices.create(body:choices[0])
  options << question.answer_choices.create(body:choices[1])
  options << question.answer_choices.create(body:choices[2])
  users.each do |user|
    user.user_answers.create(answer_choice_id: options.sample.id, weight: rand(0...100))
  end
end
