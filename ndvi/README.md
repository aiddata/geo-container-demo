# LTDR NDVI Data Ingest

[LTDR (Long-Term Data Record)](https://ladsweb.modaps.eosdis.nasa.gov/missions-and-measurements/applications/ltdr/) is a project at NASA that "produces, validates and distributes a climate data record." [NDVI (Normalized Difference Vegetation Index)](https://modis-land.gsfc.nasa.gov/vi.html) "provides continuity with NOAA's AVHRR NDVI time series record for historical and climate applications."
This script downloads daily NDVI data, unpacks them from HDF containers into the GeoTIFF format, and create monthly and yearly aggregates.

## Instructions

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
   - run the command in your terminal `docker build -t ndvi:[tag_name] ./ndvi`
      - you may need to use sudo before it
   - after building has completed run `docker run --rm -it -e TOKEN=$TOKEN -p 10000:8888 -v /path/GitHub/gq-notebook-containers/ndvi:/home/jovyan/ltdr_ndvi ndvi`
   - from the terminal output, copy the link given and replace 8888 with 10000 in your browser
