#!/bin/bash
apt-get update;
sudo apt install apache2;
sudo systemctl start apache2;
sudo fallocate -l 1G /swapfile;
sudo chmod 600 /swapfile;
sudo mkswap /swapfile;
sudo swapon /swapfile;
sudo cp /etc/fstab /etc/fstab.bak;
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab;
sudo sysctl vm.swappiness=10;
sudo apt-get install -y mysql-server-8.0;
sudo systemctl start mysql;
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz;
tar xzvf node_exporter-*.t*gz;
useradd --no-create-home --shell /bin/false node_exporter;
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter
cp /root/Project_Otus/back2-SRV3/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd
