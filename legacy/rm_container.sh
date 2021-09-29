#!/bin/bash 
# sudo docker rm my_ui
sudo docker rm storm_graphite
# sudo docker rm my_zookeeper
# sudo docker rm my_nimbus
# sudo docker rm my_supervisor_1
# sudo docker rm storm_grafana
sudo docker rm $(sudo docker ps -aq -f name="(my|storm-cluster)_[_(a-z|1-9)*]*")