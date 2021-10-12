#!/bin/bash
container=`docker ps -qf name=nimbus`
sudo docker exec -w / $container ./deploy_check_topology.sh