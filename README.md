# TaskPlanner
API для TODO реализовано с помощью java spring, в качестве БД используется Prostgres 

## Поддержвиваемые методы:
GET /api/todo - возвращает все todo<br>
GET /api/todo/{id} - возвращает todo по id<br>
PATCH /api/todo/{id} - устанавливает isCompleted=true для todo по id<br>
POST PUT /api/todo - создает новое id в body необходимо передать description<br>
DELETE /api/todo/{id} - удаляет todo по id<br>

GET /health - для проверки работы сервиса

## Сборка и запуск

__сборка производится при помощи build.sh__
Собираются 2 образа при помощи buildX для arm64 и amd64

запуск производится при помощи docker-compose up по умолчанию собирается для arm64, можно изменить в файле .env

Прошу прощения что долго делал, долго разбирался с самой программой т.к. я по сути не особо программист. Если я что-либо неверно понял, готов исправить.