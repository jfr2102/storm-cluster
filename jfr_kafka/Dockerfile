FROM wurstmeister/kafka
COPY events.json /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/events.json
COPY writetopic.sh /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/writetopic.sh
RUN chmod +x  /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/writetopic.sh