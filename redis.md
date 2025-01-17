# Домашнее задание к занятию «Кеширование Redis/memcached» - Романов Кирилл


### Задание 1. Кеширование 

Приведите примеры проблем, которые может решить кеширование. 

*Приведите ответ в свободной форме.*

### *Ответ* 

<details>

Кеширование это инструмент позволяющий увеличить скорость чтения данных. Кеш хранится в оперативной памяти, соответственно чтение и запись происходят быстрее. Примером может служить кеш браузера, кеш приложений. Для более быстрого доступа к "горячим" данным. Так же кеш может снизить нагрузку на жесткий диск и на процессор. Поиск по кешу осуществляется быстрее. 

</details>

---

### Задание 2. Memcached

Установите и запустите memcached.

*Приведите скриншот systemctl status memcached, где будет видно, что memcached запущен.*

### *Ответ* 

<details>

![Скриншот01](https://github.com/Monoroki/gitlab-hw/blob/main/img/re1.png)

</details>

---

### Задание 3. Удаление по TTL в Memcached

Запишите в memcached несколько ключей с любыми именами и значениями, для которых выставлен TTL 5. 

*Приведите скриншот, на котором видно, что спустя 5 секунд ключи удалились из базы.*

### *Ответ* 

<details>

![Скриншот02](https://github.com/Monoroki/gitlab-hw/blob/main/img/re2.png)

</details>

---

### Задание 4. Запись данных в Redis

Запишите в Redis несколько ключей с любыми именами и значениями. 

*Через redis-cli достаньте все записанные ключи и значения из базы, приведите скриншот этой операции.*

### *Ответ* 

<details>

![Скриншот03](https://github.com/Monoroki/gitlab-hw/blob/main/img/re3.png)

</details>

