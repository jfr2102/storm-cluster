FROM wurstmeister/kafka
# kafka-generator and kafka-fetcher outputing to file for exmaple topology
# If these are not required simply use the wurstmeister/kafka image directly in docker-compose.yml

ENV KAFKADIR=/opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
# simple consoler producer from json file:
# COPY events.json ${KAFKADIR}/events.json
# COPY writetopic.sh ${KAFKADIR}/writetopic.sh
# COPY listener.sh ${KAFKADIR}/listener.sh
ENV FETCHER_JAR=kafka-fetcher-1.0-SNAPSHOT-jar-with-dependencies.jar
ENV GENERATOR_JAR=kafka-generator-1.0-SNAPSHOT-jar-with-dependencies.jar


COPY ${GENERATOR_JAR} ${KAFKADIR}/${GENERATOR_JAR}
COPY ${FETCHER_JAR} ${KAFKADIR}/${FETCHER_JAR}
COPY produceroutput.csv ${KAFKADIR}/produceroutput.csv
COPY resultsoutput.csv ${KAFKADIR}/resultsoutput.csv
COPY fetcher.sh ${KAFKADIR}/fetcher.sh
COPY generator.sh ${KAFKADIR}/generator.sh
 
#replace variables in scripts
WORKDIR ${KAFKADIR}/
RUN sed -i "s/#FETCHER_JAR/${FETCHER_JAR}/" fetcher.sh
RUN sed -i "s/#GENERATOR_JAR/${GENERATOR_JAR}/" generator.sh

# make shellscripts executable 
#RUN chmod +x opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}/listener.sh
RUN chmod +x fetcher.sh
RUN chmod +x generator.sh

# RUN chmod +x  ${KAFKADIR}/writetopic.sh