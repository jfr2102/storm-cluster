#!/bin/bash
container=`docker ps -qf name=kafka`
docker exec -d -w /opt/kafka_2.13-2.7.1/ $container ./fetcher.sh
docker exec -d -w /opt/kafka_2.13-2.7.1/ $container ./generator.sh $1 $2 $3 $4 $5