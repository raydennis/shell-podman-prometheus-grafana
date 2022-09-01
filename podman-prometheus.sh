#!/bin/bash

# run the node_exporter container and collect from the host
podman run -d --net host --name prometheus-node-exporter quay.io/prometheus/node-exporter

# run prometheus at http://localhost:9090/  
podman run -d --net host --name prometheus-prometheus -v ./prometheus.yml:/etc/prometheus/prometheus.yml:z quay.io/prometheus/prometheus

# run graphana at http://localhost:3000
podman run -d --net host --name prometheus-grafana grafana/grafana
