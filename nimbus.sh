#!/bin/bash
container=`docker ps -qf name=nimbus`
sudo docker exec -w / -it $container /bin/bash

