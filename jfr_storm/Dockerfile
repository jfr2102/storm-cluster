FROM storm:latest
#install nc for debugging purpose, iproute2 for pumba chaos test
RUN apt-get update -y
#RUN apt-get install -y netcat
RUN apt-get install -y iproute2 
# OVERWRITE CONFIG
COPY storm.yaml "$STORM_CONF_DIR/storm.yaml"
RUN chown storm:storm "$STORM_CONF_DIR/storm.yaml"

ENV TOPOLOGY_JAR=topology.jar
ENV TOPOLOGY_MAIN=MainTopology
ENV TOPOLOGY_NAME=MyTopology

# COPY TOPOLOGY
COPY "$TOPOLOGY_JAR" "/$TOPOLOGY_JAR"
RUN chown storm:storm "/$TOPOLOGY_JAR"

# Copy Topology deploy script
COPY deploy_topology.sh /deploy_topology.sh
RUN chmod +rwx /deploy_topology.sh

# replace params in script
RUN sed -i "s/#TOPOLOGY_JAR/${TOPOLOGY_JAR}/" /deploy_topology.sh
RUN sed -i "s/#TOPOLOGY_MAIN/${TOPOLOGY_MAIN}/" /deploy_topology.sh
RUN sed -i "s/#TOPOLOGY_NAME/${TOPOLOGY_NAME}/" /deploy_topology.sh