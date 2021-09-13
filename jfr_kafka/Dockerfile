FROM wurstmeister/kafka
COPY events.json /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/events.json
COPY writetopic.sh /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/writetopic.sh
COPY kafka-generator-1.0-SNAPSHOT-jar-with-dependencies.jar /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/kafka-generator-1.0-SNAPSHOT-jar-with-dependencies.jar
COPY listener.sh /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/listener.sh
RUN chmod +x  /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/writetopic.sh
#RUN /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin/kafka-topics.sh --create --zookeeper ${KAFKA_ZOOKEEPER_CONNECT}:2181 --replication-factor 1 --partitions 2 --topic partitiontopic