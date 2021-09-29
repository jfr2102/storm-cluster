#!/bin/bash
# todo general shellscript for fetcher and generator within container? -> no name depdencies
container=`docker ps -qf name=kafka`
docker exec -w /opt/kafka_2.13-2.7.1/ $container ./fetcher.sh
docker exec -w /opt/kafka_2.13-2.7.1/ $container ./generator.sh
