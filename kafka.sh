#!/bin/bash
container=`docker ps -qf name=kafka`
docker exec -w /opt/kafka_2.13-2.7.1/ -it $container /bin/bash                                                           