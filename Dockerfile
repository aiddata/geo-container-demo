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
    h5py \
    libgdal-hdf5 \
    hdf5 \
    proj \
    numpy

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --no-cache-dir --no-binary rasterio

# RUN git clone https://github.com/aiddata/geo-datasets --depth 1 --branch develop-k8s
# RUN pip install ./geo-datasets/global_scripts/data_manager

RUN git clone https://github.com/aiddata/geo-datasets --branch geo-container-demo
RUN pip install ./geo-datasets/global_scripts/data_manager --no-cache-dir



# COPY code/ndvi.ipynb /home/jovyan/code/ndvi.ipynb
# COPY code/config.ini /home/jovyan/code/config.ini
# COPY code/population.ipynb /home/jovyan/code/population.ipynb

# add your token here
ENV TOKEN="eyJ0eXAiOiJKV1QiLCJvcmlnaW4iOiJFYXJ0aGRhdGEgTG9naW4iLCJzaWciOiJlZGxqd3RwdWJrZXlfb3BzIiwiYWxnIjoiUlMyNTYifQ.eyJ0eXBlIjoiVXNlciIsInVpZCI6InNnb29kbTA0IiwiZXhwIjoxNzI4MDY3MTQ5LCJpYXQiOjE3MjI4ODMxNDksImlzcyI6IkVhcnRoZGF0YSBMb2dpbiJ9.bnkuA8TVxqyBZoeznQrp1SDHxamfLz1TTJetPdIW3S0_2k9vlnMnxDJMLQ41jXY2Sr-H8OD-UemJYjq6MGZtSLhFl2QxEkftWhcCjhy7PGLU5txXuPW4GSGdJFZqQHu-qurgSSycOXGIUwDNgiUNtJj2peHFOLnk2QNu3FNto0ftDleAbxFvS_6SyR7MonygCAJrPLknG7zEJqj9ult3BmznSW_IMWaIya96KdLDnpvtPinRrMwQgfbC1hu9j4itwZCauGcVYmANu1kuPLJmh6rQznyu1Ntg9kNqzBiAU9X60SLuOvq5IZhDZYNeRTbUbvn6fBhjdipSmVzPB1MHSw"
