---
# Домашнее задание к занятию 2 «Кластеризация и балансировка нагрузки» - Романов Кирилл

### Задание 1

- Запустите два simple python сервера на своей виртуальной машине на разных портах
- Установите и настройте HAProxy, воспользуйтесь материалами к лекции по [ссылке](2/)
- Настройте балансировку Round-robin на 4 уровне.
- На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy.

### *Ответ*

<details>

![Скриншот01](https://github.com/Monoroki/gitlab-hw/blob/main/img/cla1.png)


[Haproxy_1](https://github.com/Monoroki/gitlab-hw/tree/main/file/haproxy.cfg)

</details>

------

### Задание 2

- Запустите три simple python сервера на своей виртуальной машине на разных портах
- Настройте балансировку Weighted Round Robin на 7 уровне, чтобы первый сервер имел вес 2, второй - 3, а третий - 4
- HAproxy должен балансировать только тот http-трафик, который адресован домену example.local
- На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy c использованием домена example.local и без него.


### *Ответ*

<details>

![keep1.png](https://github.com/Monoroki/gitlab-hw/blob/main/img/cla2.png)

[Haproxy_2](https://github.com/Monoroki/gitlab-hw/tree/main/file/haproxy2.cfg)

</details>


------
