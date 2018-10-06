# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_categories(*categories)
  categories.each do |category|
    Category.create(title: category)
  end
end

def create_test(title, category, *level)
  category_id = Category.find_by(title: category).id
  test = Test.create(title: title, category_id: category_id)
  if !level.empty?
    test.level = level[0]
    test.save
  end
end

def create_question_and_answers(test_title, question_body, *answers_bodies, correct_answer_number)
  test_id = Test.find_by(title: test_title).id
  question = Question.create(body: question_body, test_id: test_id)
  answers_bodies.each_with_index do |answer_body, index|
    answer = Answer.create(body: answer_body, question_id: question.id)
    if index == correct_answer_number - 1
      answer.correct = true
      answer.save
    end
  end
end

create_categories('History', 'Cinema', 'Football')

create_test('Kievan Rus', 'History')
create_question_and_answers('Kievan Rus', 'When was Kievan Rus founded?', 'In 27 B.C.', 'In 882', 'In 1991', 'In 1917', 2)
create_question_and_answers('Kievan Rus', 'Who did convert Kievan Rus to christianity?', 'Jesus Christ', 'Vladimir Putin', 'Salah ad-Din Yusuf', 'Vladimir the Great', 4)
create_question_and_answers('Kievan Rus', 'What was the capital of Kievan Rus?', 'Chernigov', 'Kiev', 'Moscow', 'Balashiha', 2)
create_question_and_answers('Kievan Rus', 'By whom was Kievan Rus founded?', 'Igor', 'Rurik', 'Oleg', 'Olga', 3)

create_test('Middle Ages', 'History', 1)
create_question_and_answers('Middle Ages', 'The average lifespan during the middle ages was what?', '20', '75', '35', '50', 3)
create_question_and_answers('Middle Ages', 'What document was created to limit the king\'s power in England', 'Constitution', 'Magna Carta', 'Shay\'s Rebellion', 'Bill of Rights', 2)
create_question_and_answers('Middle Ages', 'Which international event was started by Pope Urban II\'s sermon at Clermont in 1095?', 'The Hundred Years\' War', 'The Peace of God movement', 'The First Crusade', 'The Great Schism', 1)
create_question_and_answers('Middle Ages', 'What proportion of Europe\'s population is estimated to have been killed by the Black Death in the 14th century?', '10-15%', 'About 95%', '30-60%', 'Nobody was killed', 3)

create_test('Oscar Award', 'Cinema', 2)
create_question_and_answers('Oscar Award', 'Which two actors directed themselves in movies and won Oscars for Best Actor?', 'Al Pacino and Timothy Hutton', 'Jack Nicholson and Kevin Spacey', 'Laurence Olivier and Roberto Benigni', 'Tom Hanks and Paul Newman', 3)
create_question_and_answers('Oscar Award', '"After all, tomorrow is another day!" was the last line in which Oscar-winning Best Picture?', 'Gone With the Wind', 'Great Expectations', 'Harold and Maude', 'The Matrix', 1)
create_question_and_answers('Oscar Award', 'Who is the only person to win an Oscar for Best Director for the only movie he ever directed?', 'Bob Fosse', 'Frank Borzage', 'Leo McCarey', 'Jerome Robbins', 4)
create_question_and_answers('Oscar Award', 'Who is the most nominated actor in Academy history?', 'Jack Nicholson', 'Laurence Olivier', 'Spencer Tracy', 'Paul Newman', 1)

create_test('International Cinema', 'Cinema', 2)
create_question_and_answers('International Cinema', 'Austrian born director Fritz Lang started his film-making career in Germany during the Weimar Republic Era. After fleeing Nazi Germany, he continued his thread of film noir movies from Hollywood. Which of the following epic movies is NOT one of his movies?', 'Metropolis', 'Fury', 'M', 'Dial M for Murder', 1)
create_question_and_answers('International Cinema', 'British actor Daniel Craig, now a household name synonymous with the "James Bond" franchise, made his first appearance as Bond in which film, released worldwide in 2006?', 'Quantum of Solace', 'Die Another Day', 'Skyfall', 'Casino Royale', 4)
create_question_and_answers('International Cinema', 'Which of these movies is set in Wales and stars Hugh Grant as cartographer Reginald Anson?', 'The Lair of the White Worm', 'Cloud Atlas', 'Notting Hill', 'The Englishman Who Went Up a Hill But Came Down a Mountain', 4)
create_question_and_answers('International Cinema', 'Which of these actors was born in New York and played Mark Zuckerberg in "The Social Network"?', 'Andrew Garfield', 'Jesse Eisenberg', 'Ben Affleck', 'Bradley Cooper', 2)

create_test('World Cup', 'Football')
create_question_and_answers('World Cup', 'In what year did England win their first and only World Cup?', '1966', '1994', '2002', '2018', 1)
create_question_and_answers('World Cup', 'Which country has won the World Cup the most times?', 'Germany', 'Spain', 'Brazil', 'France', 3)
create_question_and_answers('World Cup', 'Team of which country is the actual owner of the World Cup?', 'Portugal', 'France', 'Croatia', 'Russia', 2)
create_question_and_answers('World Cup', 'Which country won the first World Cup?', 'Uruguay', 'Brazil', 'Italy', 'Germany', 1)

create_test('Supporters', 'Football', 1)
create_question_and_answers('Supporters', 'What team does Elton John support and own?', 'Coventry City', 'Manchester City', 'Wimbledon', 'Watford F.C.', 4)
create_question_and_answers('Supporters', 'Which German club has the largest average attendance?', 'Herta', 'Borussia Dortmund', 'Bayern', 'Hannover', 2)
create_question_and_answers('Supporters', 'Fans of which Italian club are called "Irriducibili"?', 'Internazionale', 'Fiorentina', 'Lazio', 'Torino', 3)
create_question_and_answers('Supporters', 'Fans of which team come together at the forum named "Landskrona"?', 'Wisla', 'Legia', 'Partizan', 'Zenit', 4)
