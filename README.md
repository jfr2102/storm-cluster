# Storm-cluster
Storm cluster on Docker with Graphite (+ Grafana) Metrics Reporter.

Based on [Offical Apache Storm docker image](https://hub.docker.com/_/storm) , [Official docker image for Graphite](https://hub.docker.com/r/graphiteapp/graphite-statsd) and [The official Grafana docker container](https://hub.docker.com/r/grafana/grafana)

Usage
-----

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
Run topology on nimbus (with shell on nimbus):
```bash
$ storm jar /topology.jar MainTopology Mytopology
```
Configuration
----
Adding configs to [storm.yaml](/jfr_storm/storm.yaml) file overwrites the [default values](https://github.com/apache/storm/blob/v2.2.0/conf/defaults.yaml) (for version 2.2.0).
