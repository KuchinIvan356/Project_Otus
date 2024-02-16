#!/bin/bash
apt install bash-completion git prometheus-node-exporter -y;
useradd --no-create-home --shell /bin/false node_exporter;
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter;
sudo apt install default-jdk -y;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/e/elasticsearch/elasticsearch-8.9.1-amd64.deb;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/k/kibana/kibana-8.9.1-amd64.deb;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/l/logstash/logstash-8.9.1-amd64.deb;
sudo dpkg -i elasticsearch*.deb;
sudo dpkg -i kibana*.deb;
sudo dpkg -i logstash*.deb;
systemctl daemon-reload;
systemctl enable --now elasticsearch;
systemctl enable --now kibana;
systemctl enable --now logstash;
systemctl enable --now prometheus-node-exporter;
/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic;
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana;
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node
cp /root/Project_Otus.git/nginx-SRV1/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd
