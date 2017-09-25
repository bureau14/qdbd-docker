FROM       ubuntu:latest

# Fixing debconf warning about TREM
ENV        DEBIAN_FRONTEND teletype

# Latest Ubuntu doesn't have pre-installed locales package (locale-gen) and 'ip' from iproute
# apt-utils also fix warnings from debconfig
RUN        apt-get clean && apt-get update && apt-get install -y --no-install-recommends apt-utils locales iproute
RUN        locale-gen en_US.UTF-8

# Decompress the tarball in the container
ADD        qdb-*-linux-64bit-server.tar.gz /usr/

# Add the wrapper script
ADD        qdbd-docker-wrapper.sh /usr/bin/

# Define mountable directory
VOLUME     ["/var/lib/qdb/db"]

# Define working directory
WORKDIR    /var/lib/qdb

# Always launch qdb process
ENTRYPOINT ["/usr/bin/qdbd-docker-wrapper.sh"]

# Expose the port qdbd is listening at
EXPOSE     2836

