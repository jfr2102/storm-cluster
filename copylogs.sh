#!/bin/bash
destination=`date +"%Y-%m-%d_%H-%M-%S"`
container=`docker ps -qf name=kafka`
mkdir ~/kafka-logs/$destination
docker cp $container:/opt/kafka_2.13-2.7.1/produceroutput.csv kafka-logs/$destination/

docker cp $container:/opt/kafka_2.13-2.7.1/resultsoutput.csv kafka-logs/$destination/