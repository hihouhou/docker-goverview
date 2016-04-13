#
# Goverview Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages for graylog
RUN apt-get update && \
    apt-get install -y git build-essential golang-go go-bindata npm nodejs-legacy pandoc && npm install -g uglifyjs uglifycss myth

#Get Goverview
RUN git clone https://github.com/vbatoufflet/goverview.git

#Install Goverview
#RUN cd goverview && \
#    make && \
#    make install

#Add config file
ADD goverview.yml /etc/goverview/

EXPOSE 8080

CMD ["goverview"]
