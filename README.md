# Домашнее задание к занятию «Система мониторинга Zabbix» - `Романов Кирилл`


---

### Задание 1 

Установите Zabbix Server с веб-интерфейсом.

**Ответ:**

[Скриншот к заданию 1](https://github.com/Monoroki/gitlab-hw/tree/main/img/zabbix1.png)

**Использованные команды:**

wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb  
dpkg -i zabbix-release_6.0-4+debian11_all.deb  
apt update  
apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts  
sudo -u postgres createuser --pwprompt zabbix  
sudo -u postgres createdb -O zabbix zabbix  
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix   
 
---

### Задание 2 

Установите Zabbix Agent на два хоста.

**Использованные команды**

apt install zabbix-agent

**Ответ:**

[Скриншот к заданию 2](https://github.com/Monoroki/gitlab-hw/tree/main/img/zabbix2.1.png)  
[Скриншот к заданию 2](https://github.com/Monoroki/gitlab-hw/tree/main/img/zabbix2.2.png)

