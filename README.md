# Demonstrating Container Usage for Geospatial Data Processing and Replication

The repo contains all necessary material to build a Docker container that run notebooks demonstrating replicable and scalable data download pipelines, data extraction, and analysis. The data pipelines included are representative of pipelines now in [production](https://github.com/aiddata/geo-datasets) and scaled up in a larger Kubernetes cluster in order to be used in AidData's [Geoquery](https://geoquery.org) platform.



## Data Ingest

Three datasets are retrieved for this dataset: 1) NDVI, 2) population, and 3) mining related Chinese finance project locations.

### NDVI

The [LTDR (Long-Term Data Record)](https://ladsweb.modaps.eosdis.nasa.gov/missions-and-measurements/applications/ltdr/) is a project at NASA that "produces, validates and distributes a climate data record." [NDVI (Normalized Difference Vegetation Index)](https://modis-land.gsfc.nasa.gov/vi.html) "provides continuity with NOAA's AVHRR NDVI time series record for historical and climate applications."
This script downloads daily global NDVI data at 5km resolution, unpacks them from HDF files and converts them into the GeoTIFF format, and then create monthly and yearly aggregates.

### Population Count
The population count data downloaded by the notebook is from the [WorldPop Hub](https://hub.worldpop.org/geodata/listing?id=64). It conatins population data in the form of global mosaiced 1km resolution datasets.


### Global Chinese Development Finance project locations

AidData's Geospatial Chinese Development Finance dataset (Geo GCDF v3) provides the locations of a wide range of projects financed by China around the world between 2000 and 2023. For this use case, we isolate seven projects and their locations which are associated with mining activities. More information on the GeoGCDF can be found in the [dataset's GitHub repository](https://github.com/aiddata/gcdf-geospatial-data) as well as the associated [publication](https://www.nature.com/articles/s41597-024-03341-w) in Nature's Scientific Data journal.



## Instructions for Replication


### Prepare, build, and run container

1. [Create EarthData login for LAADS](https://urs.earthdata.nasa.gov/users/new)

2. Generate a token:
    - Navigate to the [LAADS DAAC website](https://ladsweb.modaps.eosdis.nasa.gov/)
    - Click on "Login" at the top right of the screen
    - Click on "Generate Token"
    - Copy the generated token into `code/config.ini`

3. Customize `config.ini` to meet your needs
    - Choose which years you'd like to download and process
    - Set your raw and output directories
    - Add your EarthData token (see step 2)
    - You can also modify the run options to scale up the backend methods and number of workers for increased performance, but we suggest starting with the defaults
        - The source code which runs the backend processing is available on GitHub [here](https://github.com/aiddata/geo-datasets/blob/575944f3d1b5feedef397e41e3a05352bfb3a033/global_scripts/data_manager/src/data_manager/dataset.py).
        - Performance of alternative run options will depend on the hardware you build and run the container on and can vary significantly (i.e., running a container locally on a laptop vs deploying in a Kubernetes cluster).

4. Build the Docker container
    - define your local dir to use as mount / source (typically the folder where this readme file resides)
        - `src_dir=/home/userx/git/geo-container-demo`
    - open permissions on src dir
        - `chmod -R 777 $src_dir`
    - set the tag you want to use:
        -`demo_tag=geodemo`
    - run the command in your terminal (use --no-cache if you need a fresh rebuild)
        -`docker build -t geodemo:$demo_tag ./`
        - you may need to use sudo before it
    - after building has completed run
        - `docker run --rm -it -p 8888:8888 -v $src_dir:/home/jovyan:Z localhost/geodemo:$demo_tag`
    - from the terminal output, copy the link given and open in your browser to access the notebook environment where you will run the subsequent steps.


### Run data pipelines

The data pipelines are made available through three Python notebooks in the `code` directory, within the Jupyter notebook you built and opened in the previous steps.

Note: If you only want to replicate the analysis, the output of the data extraction (`/data/extract.csv`) is included in the repository and you can skip to step 9.

Note: This will require nearly 40GB of space for downloads and final data products using the default settings.


5. First, open the `code/ndvi.ipynb` notebook and run through all the steps. Depending on the run options and years selected (and your internet connection) this can take a couple of hours to more than a day.

6. Open the `code/pop.ipynb` notebook and run through all the steps. The time to run this will similarly vary, but for the default options it should not take more than an hour with a typical laptop and internet connection.

7. Open the `code/gcdf.ipynb` notebook and run through all the steps. This should only take a few minutes.


### Run extract

8. Open the `code/extract.ipynb` notebook and run through all the steps. This should only take a few minutes at most.

### Run analysis

9. Open the `code/analysis.ipynb` notebook and run through all the steps. This should run nearly instantly.
