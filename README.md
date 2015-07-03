## QuasarDB Dockerfile

This repository contains the **Dockerfile** of [QuasarDB](http://www.quasardb.net/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/bureau14/qdb/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/bureau14/qdb/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull bureau14/qdb`

   (alternatively, you can build an image from Dockerfile: `docker build -t="qdb" github.com/bureau14/qdbd-docker`)

### Usage

#### Run `qdbd`

    docker run -d -p 2836:2836 --name qdb-server bureau14/qdb

#### Run `qdbd` w/ persistent directory

    docker run -d -p 2836:2836 -v <db-dir>:/var/lib/qdb --name qdb-server bureau14/qdb

#### Run `qdbd` w/ license file and persistent directory

    # Put the license.txt file in the root of your <db-dir>
    cp license.txt <db-dir>

    # Now launch the docker container with the <db-dir> mounted, the container will
    # pick up the license file automatically.
    docker run -d -p 2836:2836 -v <db-dir>:/var/lib/qdb --name qdb-server bureau14/qdb

