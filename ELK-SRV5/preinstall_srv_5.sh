#!/bin/bash
apt-get update -y;
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xzvf node_exporter-*.t*gz
useradd --no-create-home --shell /bin/false node_exporter;
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter;
sudo apt install default-jdk -y;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/e/elasticsearch/elasticsearch-8.9.1-amd64.deb;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/k/kibana/kibana-8.9.1-amd64.deb;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/l/logstash/logstash-8.9.1-amd64.deb;
sudo dpkg -i elasticsearch*.deb;
sudo systemctl enable --now elasticsearch.service
/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node
sudo dpkg -i kibana*.deb;
sudo dpkg -i logstash*.deb;
rm -r elasticsearch-8.9.1-amd64.deb;
rm -r kibana-8.9.1-amd64.deb;
rm -r logstash-8.9.1-amd64.deb;
systemctl daemon-reload;
systemctl enable --now elasticsearch;
systemctl enable --now kibana;
systemctl enable --now logstash;
systemctl enable --now prometheus-node-exporter;
cp /root/Project_Otus/ELK-SRV5/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd
