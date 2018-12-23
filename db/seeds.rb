# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_1 = Category.create(title: 'Математики')
category_2 = Category.create(title: 'Английский')

test_1 = Test.create(title: 'Сложение и вычитание', category_id: category_1.id)
test_2 = Test.create(title: 'Умножение и деление',  category_id: category_1.id, level: 1)
test_3 = Test.create(title: 'Английские слова',     category_id: category_2.id, level: 2)

question_1 = Question.create(body: '2 + 2 = ?',  test_id: test_1.id)
question_2 = Question.create(body: '4 - 5  = ?', test_id: test_1.id)
question_3 = Question.create(body: '4 + 5  = ?', test_id: test_1.id)

question_4 = Question.create(body: '2 * 3  = ?', test_id: test_2.id)
question_5 = Question.create(body: '2 * 3  = ?', test_id: test_2.id)
question_6 = Question.create(body: '6 / 2  = ?', test_id: test_2.id)

question_7 = Question.create(body: 'Перевод слова собака?', test_id: test_3.id)
question_8 = Question.create(body: 'Перевод слова кошка?',  test_id: test_3.id)
question_9 = Question.create(body: 'Перевод слова мышь?',   test_id: test_3.id)

answers_params = [
  {body: '5',     question_id: question_1.id},
  {body: '4',     question_id: question_1.id, correct: true},
  {body: '55',    question_id: question_1.id},
  {body: '1',     question_id: question_2.id},
  {body: '3',     question_id: question_2.id},
  {body: '-1',    question_id: question_2.id, correct: true},
  {body: '1',     question_id: question_3.id},
  {body: '8',     question_id: question_3.id},
  {body: '9',     question_id: question_3.id, correct: true},
  {body: '6',     question_id: question_4.id, correct: true},
  {body: '5',     question_id: question_4.id},
  {body: '7',     question_id: question_4.id},
  {body: '8',     question_id: question_5.id},
  {body: '3',     question_id: question_5.id, correct: true},
  {body: '10',    question_id: question_5.id},
  {body: '9',     question_id: question_6.id},
  {body: '3',     question_id: question_6.id, correct: true},
  {body: '11',    question_id: question_6.id},
  {body: 'Cow',   question_id: question_7.id},
  {body: 'Dog',   question_id: question_7.id, correct: true},
  {body: 'Cock',  question_id: question_7.id},
  {body: 'Cat',   question_id: question_8.id, correct: true},
  {body: 'Pig',   question_id: question_8.id},
  {body: 'Fish',  question_id: question_8.id},
  {body: 'Mouse', question_id: question_9.id, correct: true},
  {body: 'Dog',   question_id: question_9.id},
  {body: 'Pig',   question_id: question_9.id}
]

Answer.create(answers_params)

users_params = [
  {name: 'Игорь', email: 'user1@example.com'},
  {name: 'Миша',  email: 'user2@example.com'}
]

User.create(users_params)
user = User.find_by(name: "Игорь")
result_params = [
  {user_id: user.id, test_id: test_1.id, completed: true},
  {user_id: user.id, test_id: test_2.id}
]

Result.create(result_params)
