FROM storm:latest

# OVERWRITE CONFIG
COPY storm.yaml "$STORM_CONF_DIR/storm.yaml"
CMD chown storm:storm "$STORM_CONF_DIR/storm.yaml"

#COPY storm.yaml /conf/storm.yaml
#CMD chown storm:storm /conf/storm.yaml


 ENV TOPOLOGY_JAR=topology.jar
 ENV TOPOLOGY_MAIN=MainTopology
 ENV TOPOLOGY_NAME=MyTopology

# COPY AND RUN TOPOLOGY
COPY "$TOPOLOGY_JAR" "/$TOPOLOGY_JAR"
#CMD chown storm:storm "/$TOPOLOGY_JAR"
#CMD storm jar "/$TOPOLOGY_JAR" "$TOPOLOGY_MAIN" "$TOPOLOGY_NAME"