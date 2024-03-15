FROM quay.io/jupyter/base-notebook

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        build-essential \
        wget \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH="/opt/conda/bin:${PATH}"

RUN conda install -y -c conda-forge \
    gdal \
    libnetcdf \
    hdf4 \
    hdf5 \
    proj \
    numpy

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --no-cache-dir --no-binary rasterio

RUN git clone --branch develop-k8s https://github.com/aiddata/geo-datasets --depth 1

RUN pip install ./geo-datasets/global_scripts/data_manager

COPY main.ipynb /home/jovyan/ltdr_ndvi/main.ipynb

COPY config.ini /home/jovyan/ltdr_ndvi/config.ini

# add your token here
ENV TOKEN="insert token here"