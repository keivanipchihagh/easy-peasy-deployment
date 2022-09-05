#!/bin/bash
docker-compose -f redis-service/docker-compose.yml --env-file ../.env up -d --build
docker-compose -f postgres-service/docker-compose.yml --env-file ../.env up -d --build
docker-compose -f exporters/cadvisor/docker-compose.yml --env-file ../.env up -d --build
docker-compose -f exporters/node-exporter/docker-compose.yml --env-file ../.env up -d --build
docker-compose -f prometheus-service/docker-compose.yml --env-file ../.env up -d --build
docker-compose -f grafana-service/docker-compose.yml --env-file ../.env up -d --build
