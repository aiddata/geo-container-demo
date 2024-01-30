# World Pop Count Container

## Overview
This directory contains code to build a Docker container that opens a jupyter notebook in the container environment. In this notebook, there is code to run a data download process. The data downloaded by the notebook is from the [WorldPop Hub](https://hub.worldpop.org/geodata/listing?id=64). It conatins population data in the form of mosaiced 1k resolution datasets. The code in the notebook was originally derived from the [GeoQuery datasets](https://github.com/aiddata/geo-datasets).

## Instructions
These are the commands to build a Docker container that can also be found on the [Docker Hub](https://hub.docker.com/repository/docker/cmhwang/pop_notebook/general) under the name cmhwang/pop_notebook:latest.

To Build:
1. Build the Docker container
```
docker build -t world_pop_count .
docker run -p 8888:8888 world_pop_count
```

2. Follow the links provided by the ouput from the commands above. This will take you to a jupyter notebook with instructions and commands to run the World Pop Data download pipeline.
