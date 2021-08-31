# storm-cluster
Storm cluster on Docker with Graphite(+Grafana) Metrics Reporter

build and start container:
```bash
$ ./build.sh 
```
or:
```sh
$ sudo docker-compose up --build
```
Get a cmdline on nimbus / supervisor:
```bash
$ ./nimbus
```
Run topology on nimbus:
```bash
$ storm jar /topology.jar MainTopology Mytopology
```
