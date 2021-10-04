#!/bin/bash
destination=`date +"%Y-%m-%d_%H-%M-%S"`
container=`docker ps -qf name=kafka`
mkdir ~/kafka-logs/$destination
docker cp $container:/opt/kafka_2.13-2.7.1/produceroutput.csv kafka-logs/$destination/

docker cp $container:/opt/kafka_2.13-2.7.1/resultsoutput.csv kafka-logs/$destination/
# publish files via apache2:
sudo cp kafka-logs/$destination/produceroutput.csv /var/www/html
sudo cp kafka-logs/$destination/resultsoutput.csv /var/www/html