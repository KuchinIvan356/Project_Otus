cp /root/Project_Otus/nginx-SRV1/node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
cp /root/Project_Otus/nginx-SRV1/nginx.conf /etc/nginx/nginx.conf
chmod 644 /etc/nginx/nginx.conf
cp /root/Project_Otus/nginx-SRV1/default.conf /etc/nginx/sites-available/default.conf
chmod 644 /etc/nginx/sites-available/default.conf
rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf
systemctl reload nginx
cp /root/Project_Otus/nginx-SRV1/filebeat.yml /etc/filebeat/filebeat.yml
chmod 644 /etc/filebeat/filebeat.yml
systemctl daemon-reload
systemctl restart filebeat
sudo filebeat modules enable nginx
