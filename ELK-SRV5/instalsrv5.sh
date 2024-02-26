#!/bin/bash
cp /root/Project_Otus/ELK-SRV5/node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl restart node_exporter
systemctl enable node_exporter
cp /root/Project_Otus/ELK-SRV5/jvm.options /etc/elasticsearch/jvm.options.d/jvm.options
cp /root/Project_Otus/ELK-SRV5/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
cp /root/Project_Otus/ELK-SRV5/kibana.yml /etc/kibana/kibana.yml
cp /root/Project_Otus/ELK-SRV5/logstash.yml /etc/logstash/logstash.yml
cp /root/Project_Otus/ELK-SRV5/logstash-nginx-es.conf /etc/logstash/conf.d/logstash-nginx-es.conf
cp -R /etc/elasticsearch/certs /etc/kibana
chown -R root:kibana /etc/kibana/certs
cp -R /etc/elasticsearch/certs /etc/logstash/config
chown -R root:logstash /etc/logstash/config
chmod 644 /etc/elasticsearch/jvm.options.d/jvm.options
chmod 660 /etc/elasticsearch/elasticsearch.yml
chmod 660 /etc/kibana/kibana.yml
chmod 644 /etc/logstash/logstash.yml
chmod 644 /etc/logstash/conf.d/logstash-nginx-es.conf
systemctl daemon-reload
systemctl restart elasticsearch.service
systemctl restart kibana.service
systemctl restart logstash.service
