# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users seeding.
users = User.create!([
  { password: '123', email: 'administrator@gmail.com' },
  { password: '456', email: 'first_nurd@gmail.com' },
  { password: '789', email: 'second_nurd@gmail.com' },
  { password: '101', email: 'third_nurd@gmail.com' }
])
# Creating all categories
categories = Category.create!([
  { title: 'History' },
  { title: 'Cinema' },
  { title: 'Football' }
])
# Creating all tests
tests = Test.create!([
  { title: 'Kievan Rus', category: categories[0], author: users[1] },
  { title: 'Middle Ages', category: categories[0], author: users[2], level: 1 },
  { title: 'Oscar Award', category: categories[1], author: users[3], level: 2 },
  { title: 'International Cinema', category: categories[1], author: users[1], level: 2 },
  { title: 'World Cup', category: categories[2], author: users[2] },
  { title: 'Supporters', category: categories[2], author: users[3], level: 1 }
])
# Creating questions for test with id 1
questions = Question.create!([
  { body: 'When was Kievan Rus founded?', test: tests[0] },
  { body: 'Who did convert Kievan Rus to christianity?', test: tests[0] },
  { body: 'What was the capital of Kievan Rus?', test: tests[0] },
  { body: 'By whom was Kievan Rus founded?', test: tests[0] }
])
# Creating answers for test with id 1
answers = Answer.create!([
  { body: 'In 27 B.C.', question: questions[0] },
  { body: 'In 882', question: questions[0], correct: true },
  { body: 'In 1991', question: questions[0] },
  { body: 'In 1917', question: questions[0] },
  { body: 'Jesus Christ', question: questions[1] },
  { body: 'Vladimir Putin', question: questions[1] },
  { body: 'Salah ad-Din Yusuf', question: questions[1] },
  { body: 'Vladimir the Great', question: questions[1], correct: true},
  { body: 'Chernigov', question: questions[2] },
  { body: 'Kiev', question: questions[2], correct: true },
  { body: 'Moscow', question: questions[2] },
  { body: 'Balashiha', question: questions[2] },
  { body: 'Igor', question: questions[3] },
  { body: 'Rurik', question: questions[3] },
  { body: 'Oleg', question: questions[3], correct: true },
  { body: 'Olga', question: questions[3] }
])
# Creating questions for test with id 2
questions = Question.create!([
  { body: 'The average lifespan during the middle ages was what?', test: tests[1] },
  { body: 'What was created to limit the king\'s power in England?', test: tests[1] },
  { body: 'Which international event was started by Pope Urban II\'s sermon at Clermont in 1095?', test: tests[1] },
  { body: 'What proportion of Europe\'s population is estimated to have been killed by the Black Death in the 14th century?', test: tests[1] }
])
# Creating answers for test with id 2
answers = Answer.create!([
  { body: '20', question: questions[0] },
  { body: '75', question: questions[0] },
  { body: '35', question: questions[0], correct: true },
  { body: '50', question: questions[0] },
  { body: 'Constitution', question: questions[1] },
  { body: 'Magna Carta', question: questions[1], correct: true },
  { body: 'Shay\'s Rebellion', question: questions[1] },
  { body: 'Bill of Rights', question: questions[1] },
  { body: 'The Great Schism', question: questions[2] },
  { body: 'The Hundred Years\' War', question: questions[2] },
  { body: 'The Peace of God movement', question: questions[2] },
  { body: 'The First Crusade', question: questions[2], correct: true },
  { body: '10-15%', question: questions[3] },
  { body: 'About 95%', question: questions[3] },
  { body: '30-60%', question: questions[3], correct: true },
  { body: 'Nobody was killed', question: questions[3] }
])
# Creating questions for test with id 3
questions = Question.create!([
  { body: 'Which two actors directed themselves in movies and won Oscars for Best Actor?', test: tests[2] },
  { body: '"After all, tomorrow is another day!" was the last line in which Oscar-winning Best Picture?', test: tests[2] },
  { body: 'Who is the only person to win an Oscar for Best Director for the only movie he ever directed?', test: tests[2] },
  { body: 'Who is the most nominated actor in Academy history?', test: tests[2] }
])
# Creating answers for test with id 3
answers = Answer.create!([
  { body: 'Al Pacino and Timothy Hutton', question: questions[0] },
  { body: 'Jack Nicholson and Kevin Spacey', question: questions[0] },
  { body: 'Laurence Olivier and Roberto Benigni', question: questions[0], correct: true },
  { body: 'Tom Hanks and Paul Newman', question: questions[0] },
  { body: 'Gone With the Wind', question: questions[1], correct: true },
  { body: 'Great Expectations', question: questions[1] },
  { body: 'Harold and Maude', question: questions[1] },
  { body: 'The Matrix', question: questions[1] },
  { body: 'Bob Fosse', question: questions[2] },
  { body: 'Frank Borzage', question: questions[2] },
  { body: 'Leo McCarey', question: questions[2] },
  { body: 'Jerome Robbins', question: questions[2], correct: true },
  { body: 'Jack Nicholson', question: questions[3], correct: true },
  { body: 'Laurence Olivier', question: questions[3] },
  { body: 'Spencer Tracy', question: questions[3] },
  { body: 'Paul Newman', question: questions[3] }
])
# Creating questions for test with id 4
questions = Question.create!([
  { body: 'Austrian born director Fritz Lang started his film-making career in Germany during the Weimar Republic Era. After fleeing Nazi Germany, he continued his thread of film noir movies from Hollywood. Which of the following epic movies is NOT one of his movies?', test: tests[3] },
  { body: 'British actor Daniel Craig, now a household name synonymous with the "James Bond" franchise, made his first appearance as Bond in which film, released worldwide in 2006?', test: tests[3] },
  { body: 'Which of these movies is set in Wales and stars Hugh Grant as cartographer Reginald Anson?', test: tests[3] },
  { body: 'Which of these actors was born in New York and played Mark Zuckerberg in "The Social Network"?', test: tests[3] }
])
# Creating answers for test with id 4
answers = Answer.create!([
  { body: 'Metropolis', question: questions[0], correct: true },
  { body: 'Fury', question: questions[0] },
  { body: 'M', question: questions[0] },
  { body: 'Dial M for Murder', question: questions[0] },
  { body: 'Quantum of Solace', question: questions[1] },
  { body: 'Die Another Day', question: questions[1] },
  { body: 'Skyfall', question: questions[1] },
  { body: 'Casino Royale', question: questions[1], correct: true },
  { body: 'The Lair of the White Worm', question: questions[2] },
  { body: 'Cloud Atlas', question: questions[2] },
  { body: 'Notting Hill', question: questions[2] },
  { body: 'The Englishman Who Went Up a Hill But Came Down a Mountain', question: questions[2], correct: true },
  { body: 'Andrew Garfield', question: questions[3] },
  { body: 'Jesse Eisenberg', question: questions[3], correct: true },
  { body: 'Ben Affleck', question: questions[3] },
  { body: 'Bradley Cooper', question: questions[3] }
])
# Creating questions for test with id 5
questions = Question.create!([
  { body: 'In what year did England win their first and only World Cup?', test: tests[4] },
  { body: 'Which country has won the World Cup the most times?', test: tests[4] },
  { body: 'Team of which country is the actual owner of the World Cup?', test: tests[4] },
  { body: 'Which country won the first World Cup?', test: tests[4] }
])
# Creating answers for test with id 5
answers = Answer.create!([
  { body: '1966', question: questions[0], correct: true },
  { body: '1994', question: questions[0] },
  { body: '2002', question: questions[0] },
  { body: '2018', question: questions[0] },
  { body: 'Germany', question: questions[1] },
  { body: 'Spain', question: questions[1] },
  { body: 'Brazil', question: questions[1], correct: true },
  { body: 'France', question: questions[1] },
  { body: 'Portugal', question: questions[2] },
  { body: 'France', question: questions[2], correct: true },
  { body: 'Croatia', question: questions[2] },
  { body: 'Russia', question: questions[2] },
  { body: 'Uruguay', question: questions[3], correct: true },
  { body: 'Brazil', question: questions[3] },
  { body: 'Italy', question: questions[3] },
  { body: 'Germany', question: questions[3] },
])
# Creating questions for test with id 6
questions = Question.create!([
  { body: 'What team does Elton John support and own?', test: tests[5] },
  { body: 'Which German club has the largest average attendance?', test: tests[5] },
  { body: 'Fans of which Italian club are called "Irriducibili"?', test: tests[5] },
  { body: 'Fans of which team come together at the forum named "Landskrona"?', test: tests[5] }
])
# Creating answers for test with id 6
answers = Answer.create!([
  { body: 'Coventry City', question: questions[0] },
  { body: 'Manchester City', question: questions[0] },
  { body: 'Wimbledon', question: questions[0] },
  { body: 'Watford F.C.', question: questions[0], correct: true },
  { body: 'Herta', question: questions[1] },
  { body: 'Borussia Dortmund', question: questions[1], correct: true },
  { body: 'Bayern', question: questions[1] },
  { body: 'Hannover', question: questions[1] },
  { body: 'Internazionale', question: questions[2] },
  { body: 'Fiorentina', question: questions[2] },
  { body: 'Lazio', question: questions[2], correct: true },
  { body: 'Torino', question: questions[2] },
  { body: 'Wisla', question: questions[3] },
  { body: 'Gottenburg', question: questions[3] },
  { body: 'Partizan', question: questions[3] },
  { body: 'Zenit', question: questions[3], correct: true }
])
# Passing Tests seeding.
# TestPassage.create(user_id: 2, test_id: 1, passed: true)
# TestPassage.create(user_id: 2, test_id: 2)
# TestPassage.create(user_id: 2, test_id: 3)
# TestPassage.create(user_id: 3, test_id: 3, passed: true)
# TestPassage.create(user_id: 3, test_id: 4)
# TestPassage.create(user_id: 3, test_id: 5)
# TestPassage.create(user_id: 4, test_id: 5, passed: true)
# TestPassage.create(user_id: 4, test_id: 6)
# TestPassage.create(user_id: 4, test_id: 1)
