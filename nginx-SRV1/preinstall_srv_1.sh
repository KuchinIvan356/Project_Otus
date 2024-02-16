#!/bin/bash
sudo apt install nginx;
sudo systemctl start nginx;
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/KuchinIvan356/Project_Otus.git
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz;
tar xzvf node_exporter-*.t*gz;
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter;
wget -c https://mirror.yandex.ru/mirrors/elastic/8/pool/main/f/filebeat/filebeat-8.9.1-amd64.deb;
sudo dpkg -i filebeat-8.9.1-amd64.deb;
sudo filebeat modules enable nginx;
sudo systemctl status nginx
cp /root/Project_Otus.git/nginx-SRV1/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd

