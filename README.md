# README

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Миграции баз данных

Создание миграции: rails g migration add_tests_title_null_constraint Установка последней миграции по времени: rails db:
migrate Откат миграции на шаг назад по времени: rails db:rollback Конфигурация миграций в папке: /db/migrate/*.rb

# Работа с базой SQLITE

Пример в /non_project_data/sqlite_example.txt

# Сущности для создания тестирования

- Категория
- Тест
- Вопрос
- Ответ
- Пользователь
