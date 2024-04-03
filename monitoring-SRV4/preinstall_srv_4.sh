#!/bin/bash
apt-get update -y;
wget https://github.com/prometheus/prometheus/releases/download/v2.46.0/prometheus-2.46.0.linux-amd64.tar.gz;
tar xzvf prometheus-*.t*gz;
useradd --no-create-home --shell /usr/sbin/nologin prometheus
mkdir {/etc/,/var/lib/}prometheus;
cp -vi prometheus-*.linux-amd64/prom{etheus,tool} /usr/local/bin;
cp -rvi prometheus-*.linux-amd64/{console{_libraries,s},prometheus.yml} /etc/prometheus/;
chown -Rv prometheus: /usr/local/bin/prom{etheus,tool} /etc/prometheus/ /var/lib/prometheus/;
wget https://github.com/prometheus/node_exporter/releases/download/v1.6.1/node_exporter-1.6.1.linux-amd64.tar.gz;
tar xzvf node_exporter-*.t*gz;
useradd --no-create-home --shell /bin/false node_exporter
cp node_exporter-*.linux-amd64/node_exporter /usr/local/bin;
chown node_exporter: /usr/local/bin/node_exporter;
wget -c https://mirror.yandex.ru/mirrors/packages.grafana.com/enterprise/deb/pool/main/g/grafana/grafana_10.2.0_amd64.deb;
sudo dpkg -i grafana_10.2.0_amd64.deb;
systemctl daemon-reload;
systemctl start grafana-server;
cp /root/Project_Otus/monitoring-SRV4/10-eth.network /etc/systemd/network/10-eth.network
systemctl restart systemd-networkd
systemctl status grafana-server
