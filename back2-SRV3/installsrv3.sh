#!/bin/bash
cp /root/Project_Otus/back2-SRV3/000-backend2.conf /etc/apache2/sites-available/000-backend2.conf
chmod 644 /etc/apache2/sites-available/000-backend2.conf
mkdir /var/www/backend2/
cp /root/Project_Otus/back2-SRV3/index.html /var/www/backend2/index.html
chmod 644 /var/www/backend2/index.html
a2ensite 000-backend2.conf
a2dissite 000-default.conf
systemctl restart apache2
cp /root/Project_Otus/back1-SRV2/node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter

if [ -f "/etc/mysql/mysql.conf.d/mysqld.cnf" ]; then
    echo "server-id = 2" >> /etc/mysql/mysql.conf.d/mysqld.cnf
    echo "read-only = ON" >> /etc/mysql/mysql.conf.d/mysqld.cnf
    echo "gtid-mode=ON" >> /etc/mysql/mysql.conf.d/mysqld.cnf
    echo "enforce-gtid-consistency" >> /etc/mysql/mysql.conf.d/mysqld.cnf
    echo "log-replica-updates" >> /etc/mysql/mysql.conf.d/mysqld.cnf
else
    echo "Файл $config_file не найден"
fi
service mysql restart

mysql -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.1.22', SOURCE_USER='repl', SOURCE_PASSWORD='oTus2024', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;"
mysql -e "START REPLICA;"
