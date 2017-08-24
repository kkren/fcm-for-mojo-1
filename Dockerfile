FROM debian:latest
MAINTAINER kotomei <i@kotomei.moe>
EXPOSE 5005
RUN apt update && apt install -y perl tar cpanminus nano build-essential openssl git wget curl ca-certificates python python3 rsync software-properties-common apt-transport-https libnet-ssleay-perl
RUN cpanm Mojo::Webqq Getopt::Long
RUN groupadd -r mojo && useradd -r -g mojo prprrikka

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ADD https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-x64.tar.gz /usr/local/node-v8.4.0-linux-x64.tar.gz
RUN tar zxvf /usr/local/node-v8.4.0-linux-x64.tar.gz -C /usr/local/
RUN ln -s /usr/local/node-v8.4.0-linux-x64/bin/node /usr/bin/node && ln -s /usr/local/node-v8.4.0-linux-x64/bin/npm /usr/bin/npm
ENV PERL_VERSION 5.24.1
ADD https://raw.githubusercontent.com/RikkaW/FCM-for-Mojo/master/server/plugin/FFM.pm /usr/local/share/perl/$PERL_VERSION/Mojo/Webqq/Plugin/FFM.pm

RUN git clone https://github.com/RikkaW/FCM-For-Mojo.git "/mnt/workdir/FCM-For-Mojo"
WORKDIR /mnt/workdir/FCM-For-Mojo/server/node/
RUN npm install http-auth http-proxy
WORKDIR /mnt/workdir/FCM-For-Mojo/server
CMD ["node", "node/index.js"]