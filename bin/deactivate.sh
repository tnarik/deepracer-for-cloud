#!/usr/bin/env bash

# Stop minio if still running
if [[ -n "${DR_MINIO_COMPOSE_FILE}" ]]; then
  if [[ "$(echo ${DR_DOCKER_STYLE} | tr '[:upper:]' '[:lower:]')" == "swarm" ]];
    docker stack rm s3
  else
    eval docker-compose $DR_MINIO_COMPOSE_FILE -p s3 --log-level ERROR down
  fi
fi