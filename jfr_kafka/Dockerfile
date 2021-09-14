FROM wurstmeister/kafka
# kafka-generator and kafka-fetcher outputing to file for exmaple topology
# If these are not required simply use the wurstmeister/kafka image directly in docker-compose.yml

# simple consoler producer from json file:
#COPY events.json /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/events.json
#COPY writetopic.sh /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/writetopic.sh

COPY kafka-generator-1.0-SNAPSHOT-jar-with-dependencies.jar /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/kafka-generator-1.0-SNAPSHOT-jar-with-dependencies.jar
COPY listener.sh /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/listener.sh
COPY kafka-fetcher-1.0-SNAPSHOT-jar-with-dependencies.jar /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/kafka-fetcher-1.0-SNAPSHOT-jar-with-dependencies.jar
COPY produceroutput.csv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/produceroutput.csv
COPY resultsoutput.csv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/resultsoutput.csv
# make shellscripts executable 
RUN chmod +x opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/listener.sh
RUN chmod +x  /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/writetopic.sh
#RUN /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin/kafka-topics.sh --create --zookeeper ${KAFKA_ZOOKEEPER_CONNECT}:2181 --replication-factor 1 --partitions 2 --topic partitiontopic