# Домашнее задание к занятию «Работа с данными (DDL/DML)» - Романов К.В

### Задание 1
1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.

1.2. Создайте учётную запись sys_temp. 

1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)

![Скриншот01](https://github.com/Monoroki/gitlab-hw/blob/main/img/ddl1.3.png)

1.4. Дайте все права для пользователя sys_temp. 

1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

![Скриншот02](https://github.com/Monoroki/gitlab-hw/blob/main/img/ddl1.5.png)

1.6. Переподключитесь к базе данных от имени sys_temp.

![Скриншот03](https://github.com/Monoroki/gitlab-hw/blob/main/img/ddl1.6.png)

Для смены типа аутентификации с sha2 используйте запрос: 
```sql
ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
1.6. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.

1.7. Восстановите дамп в базу данных.

1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

![Скриншот04](https://github.com/Monoroki/gitlab-hw/blob/main/img/ddl1.8.png)

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*


### Задание 2
Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)
```
Название таблицы | Название первичного ключа
customer         | customer_id
```

### *Ответ*
```
actor           |   actor_id
address         |   address_id
category        |   category_id
city            |   city_id
country         |   country_id
customer        |   customer_id
film            |   film_id
film_actor      |   actor_id, film_id
film_category   |   film_id, category_id
film_text       |   film_id
inventory       |   inventory_id
language        |   language_id
payment         |   payment_id
rental          |   rental_id
staff           |   staff_id
store           |   store_id
```

---
