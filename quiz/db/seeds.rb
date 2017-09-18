# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "admin",password: "123",role: "user_admin",email: "admin@gmail.com")
@genre = Genre.create(name: "Sports",no_of_questions: 10)
@sub1 = @genre.subgenres.create(name: "Cricket",no_of_questions: 5)
@sub2 = @genre.subgenres.create(name: "Football",no_of_questions: 5)
@ques1 = @sub1.questions.create(qtype: 1,qstring: "Who is the god of cricket",score: 10)
@ques2 = @sub1.questions.create(qtype: 1,qstring: "Who scored highest runs in ODI match",score: 10)
@ques1.options.create(answer: "Sachin",isanswer: 1)
@ques1.options.create(answer: "Ponting ",isanswer: 0)
@ques1.options.create(answer: "Kallis",isanswer: 0)
@ques1.options.create(answer: "Lara",isanswer: 0)

@ques2.options.create(answer: "Sachin",isanswer: 0)
@ques2.options.create(answer: "Kohli",isanswer: 0)
@ques2.options.create(answer: "Guptill",isanswer: 0)
@ques2.options.create(answer: "Rohith Sharma",isanswer: 1)

@ques1 = @sub2.questions.create(qtype: 1,qstring: "Who won more ballondors",score: 10)
@ques2 = @sub2.questions.create(qtype: 1,qstring: "Which country won the most world cups",score: 10)

@ques1.options.create(answer: "Ronaldo",isanswer: 0)
@ques1.options.create(answer: "Pele",isanswer: 0)
@ques1.options.create(answer: "Messi",isanswer: 1)
@ques1.options.create(answer: "Iniesta",isanswer: 0)

@ques2.options.create(answer: "Italy",isanswer: 0)
@ques2.options.create(answer: "Brazil",isanswer: 1)
@ques2.options.create(answer: "Spain",isanswer: 0)
@ques2.options.create(answer: "Germany",isanswer: 0)
