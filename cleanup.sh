#!/bin/bash

# Cleanup:

## Stop and Remove the running containers:
podman rm -f prometheus-node-exporter prometheus-prometheus prometheus-grafana

## Clean up images:
podman rmi node-exporter prometheus grafana
