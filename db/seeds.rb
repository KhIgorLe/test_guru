# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_params = [
  { name: 'Игорь', email: 'user1@example.com' },
  { name: 'Миша',  email: 'user2@example.com' }
]

users = User.create(users_params)

categories_params = [ {title: 'Математика'}, {title: 'Английский'} ]

categories = Category.create(categories_params)

tests_params = [
  { title: 'Сложение и вычитание', category: categories[0], author: users[0] },
  { title: 'Умножение и деление',  category: categories[0], level: 1, author: users[0] },
  { title: 'Английские слова',     category: categories[1], level: 2, author: users[0] }
]

tests = Test.create(tests_params)

questions_params = [
  { body: '2 + 2 = ?',  test: tests[0] },
  { body: '4 - 5  = ?', test: tests[0] },
  { body: '4 + 5  = ?', test: tests[0] },
  { body: '2 * 3  = ?', test: tests[1] },
  { body: '3 * 3  = ?', test: tests[1] },
  { body: '6 / 2  = ?', test: tests[1] },
  { body: 'Перевод слова собака?', test: tests[2] },
  { body: 'Перевод слова кошка?',  test: tests[2] },
  { body: 'Перевод слова мышь?',   test: tests[2] }
]

questions = Question.create(questions_params)

answers_params = [
  { body: '5',     question: questions[0] },
  { body: '4',     question: questions[0], correct: true },
  { body: '55',    question: questions[0] },
  { body: '1',     question: questions[1] },
  { body: '3',     question: questions[1] },
  { body: '-1',    question: questions[1], correct: true },
  { body: '1',     question: questions[2] },
  { body: '8',     question: questions[2] },
  { body: '9',     question: questions[2], correct: true },
  { body: '6',     question: questions[3], correct: true },
  { body: '5',     question: questions[3] },
  { body: '7',     question: questions[3] },
  { body: '8',     question: questions[4] },
  { body: '9',     question: questions[4], correct: true },
  { body: '10',    question: questions[4] },
  { body: '9',     question: questions[5] },
  { body: '3',     question: questions[5], correct: true },
  { body: '11',    question: questions[5] },
  { body: 'Cow',   question: questions[6] },
  { body: 'Dog',   question: questions[6], correct: true },
  { body: 'Cock',  question: questions[6] },
  { body: 'Cat',   question: questions[7], correct: true },
  { body: 'Pig',   question: questions[7] },
  { body: 'Fish',  question: questions[7] },
  { body: 'Mouse', question: questions[8], correct: true },
  { body: 'Dog',   question: questions[8] },
  { body: 'Pig',   question: questions[8] }
]

Answer.create(answers_params)

result_params = [
  { user: users[0], test: tests[0], completed: true },
  { user: users[0], test: tests[1] }
]

Result.create(result_params)
