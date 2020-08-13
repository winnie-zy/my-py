## Dockerfile for making image,create Docker file system
FROM python:3.7-buster
ENV workpath=/app
## image internal path(current path at EC2/MYPY/)
WORKDIR ${workpath}  
# install unzip
RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    awscli \
&& rm -rf /var/lib/apt/lists/*

# install python site-package for thirdparty tools
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# copy all files from local dir
COPY . ${workpath}
## copy EC2 host(/MYPY/credentials)(docker work folder) to /root/.aws/credentials for later aws api/command use
COPY credentials /root/.aws/credentials

ENTRYPOINT ${workpath}/entry.sh