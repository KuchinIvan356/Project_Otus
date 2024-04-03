# Project_Otus
## Схема проекта

![Схема проекта](https://github.com/KuchinIvan356/Project_Otus/assets/149145333/9b820984-c7c8-4344-90d5-d41f264aeed9)


## nginx-SRV1 (192.168.1.21)
**Frontend, Nginx**
- Frontend веб-сервер с использованием Nginx. Используется для трансляции запросов к Backend серверам.

## back1-SRV2 (192.168.1.22)
**Backend, Apache, MySQL Source**
- Backend веб-сервер 1 с использованием Apache
- MySQL Source. Настроена репликация MySQL с сервером back2-SRV3.

## back2-SRV3 (192.168.1.23)
**Backend, Apache, MySQL Replica**
- Backend веб-сервер 2 с использованием Apache.
- MySQL Replica. Настроена репликация MySQL с сервером back1-SRV2.

## monitoring-SRV4 (192.168.1.24)
**Prometheus, Grafana**
- Установлены Prometheus для мониторинга и Grafana для визуализации.

## ELK-SRV5 (192.168.1.25)
**ELK**
- Настроен стек ELK (Elasticsearch, Logstash, Kibana) для анализа логов Frontend веб сервера.

## Ссылки
 >**FrontEnd:** [http://192.168.1.21/](http://192.168.1.21/)   
>**Prometheus:** [http://192.168.1.24:9090/](http://192.168.1.24:9090/)  
>**Grafana:** [http://192.168.1.24:3000/](http://192.168.1.24:3000/)  
>**Kibana:** [http://192.168.1.25:5601/](http://192.168.1.25:5601/)  

## Disaster Recovery Plan
Целью DRP является максимально быстрое восстановление всей серверной инфраструктуры из резервных копий, автоматизированное с помощью скриптов.
### Порядок восстановления
- Настроить сеть на серверах в соответствии со схемой.
- Запустить на каждом сервере соответствующий скрипт preinstall_srv_*.sh. Все скрипты запускаются под учетной записью root
- Скопировать публичный ssh ключ и добавить его на каждый сервер.
- Поочередно запустить на каждом сервере скрипт installsrv*.sh. Все скрипты запускаются под учетной записью root. Дождаться завершения работы скрипта и запустить на следующем сервере.
- Проверить работоспособность всех сервисов

``` BASH
bash /root/Project_Otus/nginx-SRV1/preinstall_srv_1.sh]
bash /root/Project_Otus/nginx-SRV1/installsrv1.sh]
