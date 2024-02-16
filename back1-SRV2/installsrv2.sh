#!/bin/bash
cp /root/Project_Otus/back1-SRV2/000-backend1.conf /etc/apache2/sites-available/000-backend1.conf
chmod 644 /etc/apache2/sites-available/000-backend1.conf
mkdir /var/www/backend1/
cp /root/Project_Otus/back1-SRV2/index.html /var/www/backend1/index.html
chmod 644 /var/www/backend1/index.html
a2ensite 000-backend1.conf
a2dissite 000-default.conf
systemctl restart apache2
cp /root/Project_Otus/back1-SRV2/node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter

config_file="/etc/mysql/mysql.conf.d/mysqld.cnf"
new_bind_address="bind-address = 0.0.0.0"
if [ -f "$config_file" ]; then
    sed -i "s/^bind-address\s*=\s*127.0.0.1/$new_bind_address/" $config_file
else
    echo "Файл $config_file не найден"
fi

if [ -f "$config_file" ]; then
    echo "server-id = 1" >> $config_file
    echo "binlog_format = row" >> $config_file
    echo "gtid-mode=ON" >> $config_file
    echo "enforce-gtid-consistency" >> $config_file
    echo "log-replica-updates" >> $config_file
else
    echo "Файл $config_file не найден"
fi
service mysql restart
echo "Конфиг MySQL настроен!"

mysql -e "CREATE USER 'repl'@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTus2024';"
mysql -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY 'oTus2024';"
