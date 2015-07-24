# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
languages = ["Ruby","Python","C++", "Javascript", "Go", "Haskell", "COBOL", "PHP", "Perl", "LOLCODE", "Ook!", "Malbolge"]
names = ["Adam_Gaynor","Ari_Weitzman","Carl_Baron","Charles_zahn","Daniel_Reich","Dean_Hu","Ekaterina_Klenova","Eric_Zhu","Gregory_Kane","Griffin_Adams","James_Carney","John_Bruno","Joshua_Weiss","Maxfield_Lewin","Mel_Muhammad","Peter_Phillips","Rafael_Maldonado","Ryan_Couto","Sam_HoneStuder","Scott_Rogers","Steve_Aragon","Thomas_Bescherer","Wai_Phyo_Maung"]
users = []
names.each do |name|
  users << User.create(
  username: name,
  email: Faker::Internet.email,
  password: "password",
  language: languages.sample,
  about_field_one: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  about_field_two: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  about_field_three: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  job: "Dev at #{Faker::App.name}",
  age: Faker::Number.number(2),
  looking_for: languages.sample,
  avatar: Faker::Avatar.image
  )
end

25.times do
  users << User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: "password",
  language: languages.sample,
  about_field_one: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  about_field_two: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  about_field_three: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  job: "Dev at #{Faker::App.name}",
  age: Faker::Number.number(2),
  looking_for: languages.sample,
  avatar: Faker::Avatar.image
  )
end

User.create(
  username: "guest_user",
  email: "guest@example.com",
  password: "password",
  language: "Ruby",
  about_field_one: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  about_field_two: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  about_field_three: "#{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart} #{Faker::Hacker.say_something_smart}",
  job: "Student at App Academy",
  age: Faker::Number.number(2),
  looking_for: "Javascript",
  avatar: Faker::Avatar.image
)

choices = ["Yes", "No", "Now and Again"]
100.times do |i|
  options = []
  text = "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}. Yes or no?"
  question = Question.create(body: text)
  options << question.answer_choices.create(body:choices[0])
  options << question.answer_choices.create(body:choices[1])
  options << question.answer_choices.create(body:choices[2])
  users.each do |user|
    user.user_answers.create(answer_choice_id: options.sample.id, weight: [1, 10, 250].sample)
  end
end
