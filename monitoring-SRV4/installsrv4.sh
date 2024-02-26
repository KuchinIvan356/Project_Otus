#!/bin/bash
cp /root/Project_Otus/monitoring-SRV4/prometheus.yml /etc/prometheus/prometheus.yml
chmod 644 /etc/prometheus/prometheus.yml
cp /root/Project_Otus/monitoring-SRV4/prometheus.service /etc/systemd/system/prometheus.service
chmod 644 /etc/prometheus/prometheus.yml
systemctl daemon-reload
systemctl restart prometheus
systemctl restart grafana-server
systemctl enable prometheus
systemctl enable grafana-server
cp /root/Project_Otus/monitoring-SRV4/node_exporter.service /etc/systemd/system/node_exporter.service
systemctl daemon-reload
systemctl restart node_exporter
systemctl enable node_exporter
