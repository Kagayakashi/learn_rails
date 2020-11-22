# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
user = User.new(username: 'user', password: 'user', email: 'user@example.com')
admin = User.new(username: 'admin', password: 'admin', admin: true, email: 'admin@example.com')

user.save!
admin.save!

# Categories
category_bpm = Category.new(title: 'Управление Бизнес Процессами')
category_bpm.save!

# Tests
test_bpmn = Test.new(title: 'BPMN', category: category_bpm, level: 2, creator: admin)
test_bpmn.save!

# Questions & Answers

# Q.1
question_bpmn_message_event = Question.new(body: 'Каким элементом нотации является сообщение?', test: test_bpmn)
question_bpmn_message_event.save!
# A.1
Answer.create!([
  { body: 'Событие', correct: true, question: question_bpmn_message_event},
  { body: 'Логический оператор', question: question_bpmn_message_event },
  { body: 'Задача', question: question_bpmn_message_event },
])

# Q.2
question_bpmn_stop_event = Question.new(body: 'Как обозначить окончание бизнес-процесса?', test: test_bpmn)
question_bpmn_stop_event.save!
# A.2
Answer.create!([
  { body: 'Событие с одной тонкой линией', question: question_bpmn_stop_event },
  { body: 'Событие с двумя толнкими линиями', question: question_bpmn_stop_event },
  { body: 'Событие с толстой линией', correct: true, question: question_bpmn_stop_event },
])


