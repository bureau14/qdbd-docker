FROM       ubuntu:latest

# User configurable: define versions we are using
ENV        QDB_URL https://download.quasardb.net/quasardb/2.0/beta3/server/qdb-server_2.0.0-1.deb
ENV        QDB_VERSION 2.0.0
ENV        QDB_DEB_VERSION 1

#############################
# NO EDITING BELOW THIS LINE
#############################

RUN        apt-get install -y wget && \
           wget ${QDB_URL} && \
           dpkg -i qdb-server_${QDB_VERSION}-${QDB_DEB_VERSION}.deb

ADD        qdbd-docker-wrapper.sh /usr/sbin/

# Define mountable directory
VOLUME     ["/var/lib/qdb/db"]

# Define working directory
WORKDIR    /var/lib/qdb

# Always launch qdb process
ENTRYPOINT ["/usr/sbin/qdbd-docker-wrapper.sh"]

# Expose the port qdbd is listening at
EXPOSE     2836
