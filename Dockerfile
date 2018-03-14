# FROM openjdk:8-jre-alpine
FROM ubuntu:16.04

ENV DEBIAN_FRONTEND="noninteractive"

WORKDIR /root/

##################################
# Install Editors - VIM, nano, ...  
RUN apt-get update && apt-get install -y nano

# etc 
RUN apt-get update && apt-get install -y net-tools sudo locales dnsutils 
RUN apt-get install -y bind9
RUN locale-gen en_US.UTF-8

COPY conf-bind/* /etc/bind/
COPY entrypoint.sh /entrypoint.sh 
# COPY resolv.conf /etc

EXPOSE 53

ENTRYPOINT ["/entrypoint.sh"]
CMD ["shell"]


