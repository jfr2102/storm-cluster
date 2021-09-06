#!/bin/bash
./rm_container.sh
# sudo docker-compose build zookeeper
# sudo docker-compose build nimbus
# sudo docker-compose build supervisor
sudo docker-compose up --build --scale supervisor=2 
#--build
#--force-recreate
