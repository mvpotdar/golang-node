# Base the docker container off of the official golang image
FROM golang:latest

RUN cd /tmp
RUN curl -O https://nodejs.org/dist/v6.10.1/node-v6.10.1.tar.gz
RUN tar -xvf node-v6.10.1.tar.gz && rm node-v6.10.1.tar.gz
RUN cd node-v6.10.1 && ./configure && make && make install
RUN npm install -g api-console-cli && npm install -g bower

#install aws cli
RUN apt-get update -q
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy python-pip groff-base
RUN pip install awscli

#install jet cli
RUN curl -SLO "https://s3.amazonaws.com/codeship-jet-releases/2.6.0/jet-linux_amd64_2.6.0.tar.gz"
RUN tar -xaC /usr/local/bin -f jet-linux_amd64_2.6.0.tar.gz
RUN chmod +x /usr/local/bin/jet
