# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
user = User.new(username: 'user', password: 'user')
admin = User.new(username: 'admin', password: 'admin', admin: true)

user.save!
admin.save!

# Categories
category_bpm = Category.new(title: 'Управление Бизнес Процессами')
category_bpm.save!

# Tests
test_bpmn = Test.new(title: 'BPMN', category_id: category_bpm, level: 2)
test_bpmn.save!

# Questions & Answers

# Q.1
question_bpmn_message_event = Question.new(body: 'Каким элементом нотации является сообщение?')
question_bpmn_message_event.save!
# A.1
Answer.create!([
  { body: 'Событие', correct: true, question_id: question_bpmn_message_event.id },
  { body: 'Логический оператор', question_id: question_bpmn_message_event.id },
  { body: 'Задача', question_id: question_bpmn_message_event.id },
])

# Q.2
question_bpmn_stop_event = Question.new(body: 'Как обозначить окончание бизнес-процесса?')
question_bpmn_stop_event.save!
# A.2
Answer.create!([
  { body: 'Событие с одной тонкой линией', question_id: question_bpmn_stop_event.id },
  { body: 'Событие с двумя толнкими линиями', question_id: question_bpmn_stop_event.id },
  { body: 'Событие с толстой линией', correct: true, question_id: question_bpmn_stop_event.id },
])

# Testings

Testing.create!(test_id: test_bpmn, user_id: user)
Testing.create!(test_id: test_bpmn, user_id: user, completed: true)