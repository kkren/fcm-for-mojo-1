FROM debian:latest
MAINTAINER kotomei <i@kotomei.moe>
EXPOSE 5005
RUN apt update && apt install -y perl cpanminus nano build-essential openssl git wget curl ca-certificates python python3 rsync software-properties-common apt-transport-https libnet-ssleay-perl
RUN cpanm Mojo::Webqq Getopt::Long
RUN groupadd -r mojo && useradd -r -g mojo prprrikka

# From Stack Overflow :P
# Install nvm with node and npm
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.4.0
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

USER prprrikka
WORKDIR /mnt/workdir/
RUN git clone https://github.com/RikkaW/FCM-For-Mojo.git
USER root
COPY /mnt/workdir/FCM-For-Mojo/server/plugin/FFM.pm /usr/local/share/perl/5.24.1/Mojo/Webqq/Plugin/
USER prprrikka
WORKDIR /mnt/workdir/FCM-For-Mojo/server/node/
RUN npm install http-auth http-proxy
WORKDIR /mnt/workdir/FCM-For-Mojo/server/
CMD ["node", "node/index.js"]