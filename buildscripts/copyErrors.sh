#!/bin/bash
#destination=`date +"%Y-%m-%d_%H-%M-%S"`_$1_$2
destination=$1
container=`docker ps -qf name=nimbus`

name1=`curl -s 'http://172.24.38.172:8080/api/v1/topology/summary' |  python3 -c "import sys, json; print(json.load(sys.stdin)['topologies'][0]['name'])"`

if [$2 == CheckTopology]
then
    echo $name1 >> TopologyError.txt
else
    echo $name1 > TopologyError.txt
fi
sudo docker exec -i $container storm get-errors $name1 >> TopologyError.txt

if [$2 == CheckTopology]
then
    sudo mkdir /storm-logs/$destination
    sudo cp TopologyError.txt /storm-logs/$destination
fi