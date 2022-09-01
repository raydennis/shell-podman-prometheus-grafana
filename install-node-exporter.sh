#!/bin/bash

version="1.4.0-rc.0"
os="linux"

echo "Downloading Node exporter " + $version + "-" + $os

wget https://github.com/prometheus/node_exporter/releases/download/v$version/node_exporter-$version.$os-amd64.tar.gz

echo "Extacting tar"
tar xvfz /usr/local/bin/node_exporter-$version.$os-amd64.tar.gz

echo "Moving node_exporter to /usr/local/bin"
mv node_exporter-$version.$os-amd64/node_exporter /usr/local/bin/

echo "Cleaning up downloads"
rm -rf node_exporter-$version.$os-amd64*

cat > /etc/systemd/system/node_exporter.service <<EOF
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=root
Group=root
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

cat /etc/systemd/system/node_exporter.service

systemctl daemon-reload
systemctl start node_exporter
systemctl enable node_exporter
systemctl status node_exporter
