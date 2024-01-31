# LTDR NDVI Data Ingest

## Overview
[LTDR (Long-Term Data Record)](https://ladsweb.modaps.eosdis.nasa.gov/missions-and-measurements/applications/ltdr/) is a project at NASA that "produces, validates and distributes a climate data record." [NDVI (Normalized Difference Vegetation Index)](https://modis-land.gsfc.nasa.gov/vi.html) "provides continuity with NOAA's AVHRR NDVI time series record for historical and climate applications."
These scripts download daily NDVI data, unpacks them from HDF containers into the GeoTIFF format, and create monthly and yearly aggregates.. The code in the notebook was originally derived from the [GeoQuery datasets](https://github.com/aiddata/geo-datasets).

## Instructions
These are the commands to build a Docker container and the set up steps needed.

To Build:
1. Create EarthData login for LAADS
https://urs.earthdata.nasa.gov/oauth/authorize?response_type=code&client_id=A6th7HB-3EBoO7iOCiCLlA&redirect_uri=https://ladsweb.modaps.eosdis.nasa.gov/login&state=/tools-and-services/data-download-scripts/

2. Generate an app key:
https://ladsweb.modaps.eosdis.nasa.gov/tools-and-services/data-download-scripts/

3. Store the app key generated, it will be used in the notebook.

4. Build the Docker container
```
docker build -t ndvi .
docker run -p 8888:8888 ndvi
```

5. Follow the links provided by the ouput from the commands above. This will take you to a jupyter notebook with instructions and commands to run the World Pop Data download pipeline.