# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'net/http'
require 'json'



LANGUAGES = ["Ruby","Python","C++", "Javascript", "Go", "Haskell", "COBOL", "PHP", "Perl", "LOLCODE", "Ook!", "Malbolge"]

def random_about_one(name, lang, company)
  salutations = ["Hi", "Hello", "Hey", "Whats up?", "Yooooooooo", "Hola", "Greetings", "Welcome to my profile!", "Hey There,", "Salutations!", "Gutentag!", "To Whom it may concern", "Ni hao!", "Hey Hey Hey!", "What's good?"]
  quote_thing = ["Wise Words.", "True Wisdom.", "Thats something to live by.", "I couldn't have said it better myself."]
  books = ["Code Complete (2nd edition) by Steve McConnell", "The Pragmatic Programmer", "Structure and Interpretation of Computer Programs", "The C Programming Language by Kernighan and Ritchie", "Introduction to Algorithms by Cormen, Leiserson, Rivest & Stein", "Design Patterns by the Gang of Four", "Refactoring: Improving the Design of Existing Code", "The Mythical Man Month", "The Art of Computer Programming by Donald Knuth", "Compilers: Principles, Techniques and Tools by Alfred V. Aho, Ravi Sethi and Jeffrey D. Ullman", "Gödel, Escher, Bach by Douglas Hofstadter", "Clean Code: A Handbook of Agile Software Craftsmanship by Robert C. Martin", "Effective C++", "More Effective C++", "CODE by Charles Petzold", "Programming Pearls by Jon Bentley", "Working Effectively with Legacy Code by Michael C. Feathers", "Peopleware by Demarco and Lister", "Coders at Work by Peter Seibel", "Surely You're Joking, Mr. Feynman!", "Effective Java 2nd edition", "Patterns of Enterprise Application Architecture by Martin Fowler", "The Little Schemer", "The Seasoned Schemer", "Why's (Poignant) Guide to Ruby", "The Inmates Are Running The Asylum: Why High Tech Products Drive Us Crazy and How to Restore the Sanity", "The Art of Unix Programming", "Test-Driven Development: By Example by Kent Beck", "Practices of an Agile Developer", "Don't Make Me Think", "Agile Software Development, Principles, Patterns, and Practices by Robert C. Martin", "Domain Driven Designs by Eric Evans", "The Design of Everyday Things by Donald Norman", "Modern C++ Design by Andrei Alexandrescu", "Best Software Writing I by Joel Spolsky", "The Practice of Programming by Kernighan and Pike", "Pragmatic Thinking and Learning: Refactor Your Wetware by Andy Hunt", "Software Estimation: Demystifying the Black Art by Steve McConnel", "The Passionate Programmer (My Job Went To India) by Chad Fowler", "Hackers: Heroes of the Computer Revolution", "Algorithms + Data Structures = Programs", "Writing Solid Code", "JavaScript - The Good Parts", "Getting Real by 37 Signals", "Foundations of Programming by Karl Seguin", "Computer Graphics: Principles and Practice in C (2nd Edition)", "Thinking in Java by Bruce Eckel", "The Elements of Computing Systems", "Refactoring to Patterns by Joshua Kerievsky", "Modern Operating Systems by Andrew S. Tanenbaum", "The Annotated Turing"]
  quotes = ["If debugging is the process of removing software bugs, then programming must be the process of putting them in.", "Rules of Optimization: Rule 1: Dont do it. Rule 2 (for experts only): Dont do it yet. ", "The best method for accelerating a computer is the one that boosts it by 9.8 m/s2. ", "Walking on water and developing software from a specification are easy if both are frozen. ", "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it. ", "Its not at all important to get it right the first time. Its vitally important to get it right the last time. ", "First, solve the problem. Then, write the code. ", "Should array indices start at 0 or 1? My compromise of 0.5 was rejected without, I thought, proper consideration. ", "Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live. ", "Any fool can write code that a computer can understand. Good programmers write code that humans can understand. ", "Software sucks because users demand it to. ", "Linux is only free if your time has no value. ", "Beware of bugs in the above code; I have only proved it correct, not tried it. ", "There is not now, nor has there ever been, nor will there ever be, any programming language in which it is the least bit difficult to write bad code. ", "The first 90% of the code accounts for the first 90% of the development time. The remaining 10% of the code accounts for the other 90% of the development time. ", "Good code is its own best documentation. As youre about to add a comment, ask yourself, How can I improve the code so that this comment isnt needed? Improve the code and then document it to make it even clearer. ", "Programs must be written for people to read, and only incidentally for machines to execute. ", "Most software today is very much like an Egyptian pyramid with millions of bricks piled on top of each other, with no structural integrity, but just done by brute force and thousands of slaves. ", "Programming can be fun, so can cryptography however they should not be combined."]

  "#{salutations.sample}! I'm #{name}. I work as as a dev at #{company}. My favorite color is #{Faker::Commerce.color}. A quote that inspires me is \"#{quotes.sample}\". #{quote_thing.sample} My favorite team is #{Faker::Team.name}. My favorite book is #{books.sample}. Read it if you get the chance!"
end

def random_about_two
  additional_thing = ["Also... Karate", "And Im good at Monopoly, or at least I was at 12, no one will play with me any more", "Also, I was an Eagle Scout", "I can juggle, for what its worth.", "I also know how to sew!", "I repair watches in my spare time", "I practice amateur minerology in my spare time", "I was formerly an elite gymnist", "I'm a polyglot, I speak 5 langueages fluently", "Im an expert archer", "I also know quite a bit about drones", "I'm pretty good at whistling as well", "I tapdance regularly", "I am a talented freestyle rapper", "I was an olympic ski jumper in a past life", "Im also a published author", "I can make a mean plate of eggs", "My creme brulee is to die for!", "I grill all steaks to perfection", "I make a mean kale chip", "I can make my own hummus, tahini and all!", "I fly stunt planes occasionally", "I skydive at least once a week.", "I breed prize winning dogs.", "I like to think my best skill is being a dad!", "I like to think my best skill is being a mom!", "I am a skilled photographer.", "I occasionally do stunt driving.", "Im a debate champion!", "Also, Judo!" ]
  "Expert at #{LANGUAGES.sample}. Intermediate at #{LANGUAGES.sample}. Just OK at #{LANGUAGES.sample}. #{additional_thing.sample} #{additional_thing.sample}"
end

def random_about_three
  exhortations = ["You want to code together!", "You think I'd be a good pair!", "Something in my profile interests you.", "You have advice/ want to be friends!", "You want to!", "Its a tuesday.", "You feel the notion.", "That seems like a good idea.", "You have nothing better to do."]
  addon = ["I swear Im easy to get along with!", "My mother says Im easy to work with.", "I'm sure we will make beatiful music (read: code) together.", "Just do it!", "What have you got to lose?", "Im sure it won't be the worst decision you make today!", "Four out of five dentists agree it is a good idea.", "I don't bite!", "Act now, and I can throw in a free toaster.", "What do you have to lose?", "I could be the Wozniak to your Jobs!", "I could be the Brin to your Page!", "We will have such fun!", "I eagerly await your response!", "I bet our karma are in sync.", "The best time to find a coding pair is ten years ago, the second best time is tomorrow!", "Dont wait, act now!", "He who hesitates is lost.", "Why not?", "Send me a code sample.", "Send me a selfie.", "Tell me your favorite color.", "Tell me about a project youve worked on.", "If you message me, I will share my secret with you.", "Use the codeword pineapple in your message so I know you took the time to read my profile." ]
  exhortations.sample + " " + addon.sample + " " + addon.sample
end

names = ["Adam_Gaynor","Ari_Weitzman","Carl_Baron","Charles_zahn","Daniel_Reich","Dean_Hu","Ekaterina_Klenova","Eric_Zhu","Gregory_Kane","Griffin_Adams","James_Carney","John_Bruno","Joshua_Weiss","Maxfield_Lewin","Mel_Muhammad","Peter_Phillips","Rafael_Maldonado","Ryan_Couto","Sam_HoneStuder","Scott_Rogers","Steve_Aragon","Thomas_Bescherer","Wai_Phyo_Maung"]
users = []
names.each do |name|
  url = URI.parse('http://uifaces.com/api/v1/random')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
img_url = JSON.parse(res.body)["image_urls"]["epic"]
  lang = LANGUAGES.sample
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
  looking_for: LANGUAGES.sample,
  avatar: img_url
  )
end

100.times do
  url = URI.parse('http://uifaces.com/api/v1/random')
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req)}
  img_url = JSON.parse(res.body)["image_urls"]["epic"]
  name = Faker::Internet.user_name
  lang = LANGUAGES.sample
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
  looking_for: LANGUAGES.sample,
  avatar: img_url
  )
end

User.create(
  username: "guest_user",
  email: "guest@example.com",
  password: "password",
  language: "Ruby",
  about_field_one: "nothing",
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
