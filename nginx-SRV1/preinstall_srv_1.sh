#!/bin/bash
apt-get update;
sudo apt install nginx;
sudo systemctl start nginx;
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz
tar xzvf node_exporter-*.t*gz
useradd --no-create-home --shell /bin/false node_exporter
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/f/filebeat/filebeat-8.9.1-amd64.deb;
sudo dpkg -i filebeat-8.9.1-amd64.deb;
sudo filebeat modules enable nginx;
cp /root/Project_Otus/nginx-SRV1/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd
sudo systemctl status nginx

