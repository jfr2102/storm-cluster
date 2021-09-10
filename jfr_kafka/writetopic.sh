#!/bin/bash
#todo env variables for all config (IP, Port, Topic, Filename) etc.
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic mytopic < events.json