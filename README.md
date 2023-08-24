---
# Домашнее задание к занятию 1 «Disaster recovery и Keepalived» - Романов Кирилл

### Задание 1

- Дана [схема](1/hsrp_advanced.pkt) для Cisco Packet Tracer, рассматриваемая в лекции.
- На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)
- Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).
- Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.
- На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.

### *Ответ*

<details>

![Скриншот01](https://github.com/Monoroki/gitlab-hw/blob/main/img/hsrp1.png)

![Скриншот02](https://github.com/Monoroki/gitlab-hw/blob/main/img/hsrp2.png)

[Cхема в формате pkt](https://github.com/Monoroki/gitlab-hw/tree/main/file/hsrp_DZ.pkt)

</details>

------

### Задание 2

- Запустите две виртуальные машины Linux, установите и настройте сервис Keepalived как в лекции, используя пример конфигурационного [файла](1/keepalived-simple.conf).
- Настройте любой веб-сервер (например, nginx или simple python server) на двух виртуальных машинах
- Напишите Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html в root-директории данного веб-сервера.
- Настройте Keepalived так, чтобы он запускал данный скрипт каждые 3 секунды и переносил виртуальный IP на другой сервер, если bash-скрипт завершался с кодом, отличным от нуля (то есть порт веб-сервера был недоступен или отсутствовал index.html). Используйте для этого секцию vrrp_script
- На проверку отправьте получившейся bash-скрипт и конфигурационный файл keepalived, а также скриншот с демонстрацией переезда плавающего ip на другой сервер в случае недоступности порта или файла index.html

### *Ответ*

<details>

```
#!/bin/bash
if [[ $(netstat -tuln | grep LISTEN | grep :80) ]] && [[ -f /var/www/html/index.nginx-debian.html ]]; then
        exit 0
else
        sudo systemctl stop keepalived
fi
```

![keep1.png](https://github.com/Monoroki/gitlab-hw/blob/main/img/keep1.png)

![keep2.png](https://github.com/Monoroki/gitlab-hw/blob/main/img/keep2.png)

![keep4.png](https://github.com/Monoroki/gitlab-hw/blob/main/img/keep4.png)

</details>


------
