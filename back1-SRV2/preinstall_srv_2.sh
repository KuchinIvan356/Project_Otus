#!/bin/bash
apt-get update;
sudo apt install apache2;
sudo systemctl start apache2;
sudo apt install mysql-server-8.0;
sudo systemctl start mysql;
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa <<< y
git clone https://github.com/KuchinIvan356/Project_Otus.git
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz;
tar xzvf node_exporter-*.t*gz;
useradd --no-create-home --shell /bin/false node_exporter;
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter
cp /root/Project_Otus.git/nginx-SRV1/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd
