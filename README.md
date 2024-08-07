# Demonstrating Container Usage for Geospatial Data Processing and Replication

Docker container that run notebooks with GeoQuery data download pipelines.
Data download pipelines from [Geoquery datasets](https://github.com/aiddata/geo-datasets).



## Data Ingest


### NDVI

The [LTDR (Long-Term Data Record)](https://ladsweb.modaps.eosdis.nasa.gov/missions-and-measurements/applications/ltdr/) is a project at NASA that "produces, validates and distributes a climate data record." [NDVI (Normalized Difference Vegetation Index)](https://modis-land.gsfc.nasa.gov/vi.html) "provides continuity with NOAA's AVHRR NDVI time series record for historical and climate applications."
This script downloads daily NDVI data, unpacks them from HDF containers into the GeoTIFF format, and create monthly and yearly aggregates.

### Population Count
The population count data downloaded by the notebook is from the [WorldPop Hub](https://hub.worldpop.org/geodata/listing?id=64). It conatins population data in the form of mosaiced 1k resolution datasets. The code in the notebook was originally derived from the [GeoQuery datasets](https://github.com/aiddata/geo-datasets).


### Global Chinese Development Finance project locations

TODO


## Instructions

### Prepare, build, and run container

1. [Create EarthData login for LAADS](https://urs.earthdata.nasa.gov/users/new)

2. Generate a token:
    - Navigate to the [LAADS DAAC website](https://ladsweb.modaps.eosdis.nasa.gov/)
    - Click on "Login" at the top right of the screen
    - Click on "Generate Token"
    - Copy the generated token into `config.ini`

3. Customize `config.ini` to meet your needs
    - Choose which years you'd like to download and process
    - Set your raw and output directories
    - Add your EarthData token (see step 2)
    Refer to the `Dataset` documentation for more information about config options

4. Build the Docker container
    - define your local dir to use as mount / source (typically the folder where this readme file resides)
        - `src_dir=/home/userx/git/geo-container-demo`
    - open permissions on src dir
        - `chmod -R 777 $src_dir`
    - set the tag you want to use:
        -`demo_tag=geodemo_01`
    - run the command in your terminal (use --no-cache if you need a fresh rebuild)
        -`docker build -t geodemo:$demo_tag ./`
        - you may need to use sudo before it
    - after building has completed run
        - `docker run --rm -it -p 8888:8888 -v $src_dir:/home/jovyan:Z localhost/geodemo:$demo_tag`
    - from the terminal output, copy the link given and open in your browser


### Run data ingest

TODO


### Run analysis

TODO
