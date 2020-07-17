#!/usr/bin/env bash
xhost +local:root;
docker network create test-gui-network;
docker-compose down && docker-compose build --no-cache && docker-compose up -d;