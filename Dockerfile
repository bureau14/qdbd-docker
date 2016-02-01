FROM       ubuntu:latest

# User configurable: define versions we are using
ENV        QDB_URL         https://download.quasardb.net/quasardb/2.0/2.0.0rc3/server/qdb-2.0.0-linux-64bit-server.tar.gz

#############################
# NO EDITING BELOW THIS LINE
#############################

RUN        apt-get install -y wget
RUN        wget -qO- $QDB_URL | tar xvz -C /usr 

ADD        qdbd-docker-wrapper.sh /usr/bin/

# Define mountable directory
VOLUME     ["/var/lib/qdb/db"]

# Define working directory
WORKDIR    /var/lib/qdb

# Always launch qdb process
ENTRYPOINT ["/usr/bin/qdbd-docker-wrapper.sh"]

# Expose the port qdbd is listening at
EXPOSE     2836
