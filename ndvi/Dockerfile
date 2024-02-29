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
    
RUN conda install -y -c conda-forge gdal

RUN pip install rasterio

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --no-cache-dir --no-binary rasterio

VOLUME /home/jovyan/ltdr_ndvi

WORKDIR /home/jovyan/ltdr_ndvi

RUN chown -R jovyan /home/jovyan/ltdr_ndvi

RUN git clone --branch develop-k8s https://github.com/aiddata/geo-datasets --depth 1

RUN pip install ./geo-datasets/global_scripts/data_manager

COPY main.ipynb /home/jovyan/ltdr_ndvi/main.ipynb

COPY config.ini /home/jovyan/ltdr_ndvi/config.ini

ENV TOKEN="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbF9hZGRyZXNzIjoiY21od2FuZzkyNjE3QGdtYWlsLmNvbSIsImlzcyI6IkFQUyBPQXV0aDIgQXV0aGVudGljYXRvciIsImlhdCI6MTY5OTYwNTE4NiwibmJmIjoxNjk5NjA1MTg2LCJleHAiOjE4NTcyODUxODYsInVpZCI6ImNtaHdhbmciLCJ0b2tlbkNyZWF0b3IiOiJjbWh3YW5nIn0.mg3qEFw8tByTTbxO4J7T4KdbEBD48SbrpYbJZ48Mq3E"