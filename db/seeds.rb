# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'net/http'
require 'json'
def random_about_one(name, lang)
  url = URI.parse('http://api.theysaidso.com/qod.json')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
  quote = JSON.parse(res.body)

  salutations = ["Hi", "Hello", "Hey", "Whats up?", "Yooooooooo", "Hola", "Greetings"]
  quote_thing = ["Wise Words.", "True Wisdom.", "Thats something to live by.", "I couldn't have said it better myself."]
  "#{salutations.sample}! I'm #{name}. I work as as a dev at #{company}. A quote by #{quote["contents"]["author"]} that has always inspired me is \"#{quote["contents"]["quote"]}. #{quote_thing} My favorite color is #{Faker::Commerce.color}. When I'm not coding, you can find me playing #{Faker::Team.sport}. Naturally, I support the #{Faker::Team.name}."
end

def random_about_two
  Faker::Hacker.say_something_smart
end

def random_about_three
  Faker::Hacker.say_something_smart
end

languages = ["Ruby","Python","C++", "Javascript", "Go", "Haskell", "COBOL", "PHP", "Perl", "LOLCODE", "Ook!", "Malbolge"]
names = ["Adam_Gaynor","Ari_Weitzman","Carl_Baron","Charles_zahn","Daniel_Reich","Dean_Hu","Ekaterina_Klenova","Eric_Zhu","Gregory_Kane","Griffin_Adams","James_Carney","John_Bruno","Joshua_Weiss","Maxfield_Lewin","Mel_Muhammad","Peter_Phillips","Rafael_Maldonado","Ryan_Couto","Sam_HoneStuder","Scott_Rogers","Steve_Aragon","Thomas_Bescherer","Wai_Phyo_Maung"]
users = []
names.each do |name|
  url = URI.parse('http://uifaces.com/api/v1/random')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
img_url = JSON.parse(res.body)["image_urls"]["epic"]
  lang = languages.sample
  company = Faker::App.name
  users << User.create(
  username: name,
  email: Faker::Internet.email,
  password: "password",
  language: lang,
  about_field_one: random_about_one(name, lang, company),
  about_field_two: random_about_two,
  about_field_three: random_about_three,
  job: "Dev at #{company}",
  age: Faker::Number.number(2),
  looking_for: languages.sample,
  avatar: img_url
  )
end

25.times do
  url = URI.parse('http://uifaces.com/api/v1/random')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
  img_url = JSON.parse(res.body)["image_urls"]["epic"]
  users << User.create(
  username: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: "password",
  language: languages.sample,
  about_field_one: random_about_one(name, lang, company),
  about_field_two: random_about_two,
  about_field_three: random_about_three,
  job: "Dev at #{Faker::App.name}",
  age: Faker::Number.number(2),
  looking_for: languages.sample,
  avatar: img_url
  )
end

User.create(
  username: "guest_user",
  email: "guest@example.com",
  password: "password",
  language: "Ruby",
  about_field_one: random_about_one(name, lang, company),
  about_field_two: random_about_two,
  about_field_three: random_about_three,
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
