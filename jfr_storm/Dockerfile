FROM openjdk:11-jre-slim

ENV STORM_CONF_DIR=/conf \
    STORM_DATA_DIR=/data \
    STORM_LOG_DIR=/logs

# Add a user with an explicit UID/GID and create necessary directories
RUN set -eux; \
    groupadd -r storm --gid=1000; \
    useradd -r -g storm --uid=1000 storm; \
    mkdir -p "$STORM_CONF_DIR" "$STORM_DATA_DIR" "$STORM_LOG_DIR"; \
    chown -R storm:storm "$STORM_CONF_DIR" "$STORM_DATA_DIR" "$STORM_LOG_DIR"``

# Install required packages
RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        dirmngr \
        gosu \
        gnupg \
        python \
        procps \
        wget; \
    rm -rf /var/lib/apt/lists/*; \
# Verify that gosu binary works
    gosu nobody true

ARG DISTRO_NAME=apache-storm-2.3.0

# Download Apache Storm, verify its PGP signature, untar and clean up
RUN set -eux; \
    ddist() { \
        local f="$1"; shift; \
        local distFile="$1"; shift; \
        local success=; \
        local distUrl=; \
        for distUrl in \
            'https://www.apache.org/dyn/closer.cgi?action=download&filename=' \
            https://www-us.apache.org/dist/ \
            https://www.apache.org/dist/ \
            https://archive.apache.org/dist/ \
        ; do \
            if wget -q -O "$f" "$distUrl$distFile" && [ -s "$f" ]; then \
                success=1; \
                break; \
            fi; \
        done; \
        [ -n "$success" ]; \
    }; \
    ddist "$DISTRO_NAME.tar.gz" "storm/$DISTRO_NAME/$DISTRO_NAME.tar.gz"; \
    ddist "$DISTRO_NAME.tar.gz.asc" "storm/$DISTRO_NAME/$DISTRO_NAME.tar.gz.asc"; \
    tar -xzf "$DISTRO_NAME.tar.gz"; \
    chown -R storm:storm "$DISTRO_NAME"

WORKDIR $DISTRO_NAME

ENV PATH $PATH:/$DISTRO_NAME/bin

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]


#FROM storm:latest
#install nc for debugging purpose, iproute2 for pumba chaos test, wget to fetch files
RUN apt-get update -y
#RUN apt-get install -y netcat
RUN apt-get install -y iproute2 wget
# OVERWRITE CONFIG
COPY storm.yaml "$STORM_CONF_DIR/storm.yaml"
RUN chown storm:storm "$STORM_CONF_DIR/storm.yaml"

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