# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Method to create categories.
# Creating all categories
categories = Category.create!([
  { title: 'History' },
  { title: 'Cinema' },
  { title: 'Football' }
])
# Creating all tests
tests = Test.create!([
  { title: 'Kievan Rus', category: categories[0] },
  { title: 'Middle Ages', category: categories[0], level: 1 },
  { title: 'Oscar Award', category: categories[1], level: 2 },
  { title: 'International Cinema', category: categories[1], level: 2 },
  { title: 'World Cup', category: categories[2] },
  { title: 'Supporters', category: categories[2], level: 1 }
])
# Creating questions for test with id 1
questions = Question.create!([
  { body: 'When was Kievan Rus founded?', test_id: tests[0].id },
  { body: 'Who did convert Kievan Rus to christianity?', test_id: tests[0].id },
  { body: 'What was the capital of Kievan Rus?', test_id: tests[0].id },
  { body: 'By whom was Kievan Rus founded?', test_id: tests[0].id }
])
# Creating answers for test with id 1
answers = Answer.create!([
  { body: 'In 27 B.C.', question_id: questions[0].id },
  { body: 'In 882', question_id: questions[0].id, correct: true },
  { body: 'In 1991', question_id: questions[0].id },
  { body: 'In 1917', question_id: questions[0].id },
  { body: 'Jesus Christ', question_id: questions[1].id },
  { body: 'Vladimir Putin', question_id: questions[1].id },
  { body: 'Salah ad-Din Yusuf', question_id: questions[1].id },
  { body: 'Vladimir the Great', question_id: questions[1].id, correct: true},
  { body: 'Chernigov', question_id: questions[2].id },
  { body: 'Kiev', question_id: questions[2].id, correct: true },
  { body: 'Moscow', question_id: questions[2].id },
  { body: 'Balashiha', question_id: questions[2].id },
  { body: 'Igor', question_id: questions[3].id },
  { body: 'Rurik', question_id: questions[3].id },
  { body: 'Oleg', question_id: questions[3].id, correct: true },
  { body: 'Olga', question_id: questions[3].id }
])
# Creating questions for test with id 2
questions = Question.create!([
  { body: 'The average lifespan during the middle ages was what?', test_id: tests[1].id },
  { body: 'What was created to limit the king\'s power in England', test_id: tests[1].id },
  { body: 'Which international event was started by Pope Urban II\'s sermon at Clermont in 1095?', test_id: tests[1].id },
  { body: 'What proportion of Europe\'s population is estimated to have been killed by the Black Death in the 14th century?', test_id: tests[1].id }
])
# Creating answers for test with id 2
answers = Answer.create!([
  { body: '20', question_id: questions[0].id },
  { body: '75', question_id: questions[0].id },
  { body: '35', question_id: questions[0].id, correct: true },
  { body: '50', question_id: questions[0].id },
  { body: 'Constitution', question_id: questions[1].id },
  { body: 'Magna Carta', question_id: questions[1].id, correct: true },
  { body: 'Shay\'s Rebellion', question_id: questions[1].id },
  { body: 'Bill of Rights', question_id: questions[1].id },
  { body: 'The Great Schism', question_id: questions[2].id },
  { body: 'The Hundred Years\' War', question_id: questions[2].id },
  { body: 'The Peace of God movement', question_id: questions[2].id },
  { body: 'The First Crusade', question_id: questions[2].id, correct: true },
  { body: '10-15%', question_id: questions[3].id },
  { body: 'About 95%', question_id: questions[3].id },
  { body: '30-60%', question_id: questions[3].id, correct: true },
  { body: 'Nobody was killed', question_id: questions[3].id }
])
# Creating questions for test with id 3
questions = Question.create!([
  { body: 'Which two actors directed themselves in movies and won Oscars for Best Actor?', test_id: tests[2].id },
  { body: '"After all, tomorrow is another day!" was the last line in which Oscar-winning Best Picture?', test_id: tests[2].id },
  { body: 'Who is the only person to win an Oscar for Best Director for the only movie he ever directed?', test_id: tests[2].id },
  { body: 'Who is the most nominated actor in Academy history?', test_id: tests[2].id }
])
# Creating answers for test with id 3
answers = Answer.create!([
  { body: 'Al Pacino and Timothy Hutton', question_id: questions[0].id },
  { body: 'Jack Nicholson and Kevin Spacey', question_id: questions[0].id },
  { body: 'Laurence Olivier and Roberto Benigni', question_id: questions[0].id, correct: true },
  { body: 'Tom Hanks and Paul Newman', question_id: questions[0].id },
  { body: 'Gone With the Wind', question_id: questions[1].id, correct: true },
  { body: 'Great Expectations', question_id: questions[1].id },
  { body: 'Harold and Maude', question_id: questions[1].id },
  { body: 'The Matrix', question_id: questions[1].id },
  { body: 'Bob Fosse', question_id: questions[2].id },
  { body: 'Frank Borzage', question_id: questions[2].id },
  { body: 'Leo McCarey', question_id: questions[2].id },
  { body: 'Jerome Robbins', question_id: questions[2].id, correct: true },
  { body: 'Jack Nicholson', question_id: questions[3].id, correct: true },
  { body: 'Laurence Olivier', question_id: questions[3].id },
  { body: 'Spencer Tracy', question_id: questions[3].id },
  { body: 'Paul Newman', question_id: questions[3].id }
])
# Creating questions for test with id 4
questions = Question.create!([
  { body: 'Austrian born director Fritz Lang started his film-making career in Germany during the Weimar Republic Era. After fleeing Nazi Germany, he continued his thread of film noir movies from Hollywood. Which of the following epic movies is NOT one of his movies?', test_id: tests[3].id },
  { body: 'British actor Daniel Craig, now a household name synonymous with the "James Bond" franchise, made his first appearance as Bond in which film, released worldwide in 2006?', test_id: tests[3].id },
  { body: 'Which of these movies is set in Wales and stars Hugh Grant as cartographer Reginald Anson?', test_id: tests[3].id },
  { body: 'Which of these actors was born in New York and played Mark Zuckerberg in "The Social Network"?', test_id: tests[3].id }
])
# Creating answers for test with id 4
answers = Answer.create!([
  { body: 'Metropolis', question_id: questions[0].id, correct: true },
  { body: 'Fury', question_id: questions[0].id },
  { body: 'M', question_id: questions[0].id },
  { body: 'Dial M for Murder', question_id: questions[0].id },
  { body: 'Quantum of Solace', question_id: questions[1].id },
  { body: 'Die Another Day', question_id: questions[1].id },
  { body: 'Skyfall', question_id: questions[1].id },
  { body: 'Casino Royale', question_id: questions[1].id, correct: true },
  { body: 'The Lair of the White Worm', question_id: questions[2].id },
  { body: 'Cloud Atlas', question_id: questions[2].id },
  { body: 'Notting Hill', question_id: questions[2].id },
  { body: 'The Englishman Who Went Up a Hill But Came Down a Mountain', question_id: questions[2].id, correct: true },
  { body: 'Andrew Garfield', question_id: questions[3].id },
  { body: 'Jesse Eisenberg', question_id: questions[3].id, correct: true },
  { body: 'Ben Affleck', question_id: questions[3].id },
  { body: 'Bradley Cooper', question_id: questions[3].id }
])
# Creating questions for test with id 5
questions = Question.create!([
  { body: 'In what year did England win their first and only World Cup?', test_id: tests[4].id },
  { body: 'Which country has won the World Cup the most times?', test_id: tests[4].id },
  { body: 'Team of which country is the actual owner of the World Cup?', test_id: tests[4].id },
  { body: 'Which country won the first World Cup?', test_id: tests[4].id }
])
# Creating answers for test with id 5
answers = Answer.create!([
  { body: '1966', question_id: questions[0].id, correct: true },
  { body: '1994', question_id: questions[0].id },
  { body: '2002', question_id: questions[0].id },
  { body: '2018', question_id: questions[0].id },
  { body: 'Germany', question_id: questions[1].id },
  { body: 'Spain', question_id: questions[1].id },
  { body: 'Brazil', question_id: questions[1].id, correct: true },
  { body: 'France', question_id: questions[1].id },
  { body: 'Portugal', question_id: questions[2].id },
  { body: 'France', question_id: questions[2].id, correct: true },
  { body: 'Croatia', question_id: questions[2].id },
  { body: 'Russia', question_id: questions[2].id },
  { body: 'Uruguay', question_id: questions[3].id, correct: true },
  { body: 'Brazil', question_id: questions[3].id },
  { body: 'Italy', question_id: questions[3].id },
  { body: 'Germany', question_id: questions[3].id },
])
# Creating questions for test with id 6
questions = Question.create!([
  { body: 'What team does Elton John support and own?', test_id: tests[5].id },
  { body: 'Which German club has the largest average attendance?', test_id: tests[5].id },
  { body: 'Fans of which Italian club are called "Irriducibili"?', test_id: tests[5].id },
  { body: 'Fans of which team come together at the forum named "Landskrona"?', test_id: tests[5].id }
])
# Creating answers for test with id 6
answers = Answer.create!([
  { body: 'Coventry City', question_id: questions[0].id },
  { body: 'Manchester City', question_id: questions[0].id },
  { body: 'Wimbledon', question_id: questions[0].id },
  { body: 'Watford F.C.', question_id: questions[0].id, correct: true },
  { body: 'Herta', question_id: questions[1].id },
  { body: 'Borussia Dortmund', question_id: questions[1].id, correct: true },
  { body: 'Bayern', question_id: questions[1].id },
  { body: 'Hannover', question_id: questions[1].id },
  { body: 'Internazionale', question_id: questions[2].id },
  { body: 'Fiorentina', question_id: questions[2].id },
  { body: 'Lazio', question_id: questions[2].id, correct: true },
  { body: 'Torino', question_id: questions[2].id },
  { body: 'Wisla', question_id: questions[3].id },
  { body: 'Gottenburg', question_id: questions[3].id },
  { body: 'Partizan', question_id: questions[3].id },
  { body: 'Zenit', question_id: questions[3].id, correct: true }
])
# Users seeding.
User.create(user_class: 1, username: 'administrator', password: 'no_figure_out', email: 'administrator@gmail.com')
User.create(user_class: 0, username: 'first_nurd', password: 'strong_pass', email: 'first_nurd@gmail.com')
User.create(user_class: 0, username: 'second_nurd', password: 'more_strong_pass', email: 'second_nurd@gmail.com')
User.create(user_class: 0, username: 'third_nurd', password: 'most_strong_pass', email: 'third_nurd@gmail.com')
# Passing Tests seeding.
PassingTest.create(user_id: 2, test_id: 1, passed: true)
PassingTest.create(user_id: 2, test_id: 2)
PassingTest.create(user_id: 2, test_id: 3)
PassingTest.create(user_id: 3, test_id: 3, passed: true)
PassingTest.create(user_id: 3, test_id: 4)
PassingTest.create(user_id: 3, test_id: 5)
PassingTest.create(user_id: 4, test_id: 5, passed: true)
PassingTest.create(user_id: 4, test_id: 6)
PassingTest.create(user_id: 4, test_id: 1)
