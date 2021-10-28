FROM storm:latest
#install nc for debugging purpose, iproute2 for pumba chaos test, wget to fetch files
RUN apt-get update -y
#RUN apt-get install -y netcat
RUN apt-get install -y iproute2 wget
# OVERWRITE CONFIG
COPY storm.yaml "$STORM_CONF_DIR/storm.yaml"
RUN chown storm:storm "$STORM_CONF_DIR/storm.yaml"

ARG DISTRO_NAME=apache-storm-2.3.0
ENV TOPOLOGY_JAR=topology.jar
ENV TOPOLOGY_MAIN=MainTopology
ENV TOPOLOGY_NAME=MyTopology
ENV CHECK_TOPOLOGY_JAR=check_topology.jar

# COPY TOPOLOGY
COPY "$TOPOLOGY_JAR" "/$TOPOLOGY_JAR"
RUN chown storm:storm "/$TOPOLOGY_JAR"
# Correctness Check Topology
COPY "$CHECK_TOPOLOGY_JAR" "/$CHECK_TOPOLOGY_JAR"

# Copy Topology deploy script
COPY deploy_topology.sh /deploy_topology.sh
RUN chmod +rwx /deploy_topology.sh
# for correctnes check topology script:
RUN cp /deploy_topology.sh /deploy_check_topology.sh

# replace params in scripts
RUN sed -i "s/#TOPOLOGY_JAR/${TOPOLOGY_JAR}/" /deploy_topology.sh
RUN sed -i "s/#TOPOLOGY_MAIN/${TOPOLOGY_MAIN}/" /deploy_topology.sh
RUN sed -i "s/#TOPOLOGY_NAME/${TOPOLOGY_NAME}/" /deploy_topology.sh

RUN sed -i "s/#TOPOLOGY_JAR/${CHECK_TOPOLOGY_JAR}/" /deploy_check_topology.sh
RUN sed -i "s/#TOPOLOGY_MAIN/${TOPOLOGY_MAIN}/" /deploy_check_topology.sh
RUN sed -i "s/#TOPOLOGY_NAME/${TOPOLOGY_NAME}/" /deploy_check_topology.sh

# prometheus metrics exporter
ENV REPORTER_VERSION=0.0.3
ENV REPORTER_JAR=storm-metrics-reporter-prometheus-${REPORTER_VERSION}.jar
RUN wget https://github.com/jfr2102/storm-metrics-reporter-prometheus/releases/download/${REPORTER_VERSION}/${REPORTER_JAR} -P extlib
RUN chown -R storm:storm extlib/${REPORTER_JAR}
RUN cp extlib/${REPORTER_JAR} extlib-daemon
RUN chown -R storm:storm extlib-daemon/${REPORTER_JAR}