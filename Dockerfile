FROM debian:latest
EXPOSE 5003 5004 5005
RUN apt update && apt install -y perl cpanminus build-essential openssl git wget curl ca-certificates python python3 rsync software-properties-common apt-transport-https libnet-ssleay-perl
RUN cpanm Mojo::Webqq Getopt::Long

# From Stack Overflow :P
# Install Node.js
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.4.0
# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
# Finish

RUN git clone https://github.com/RikkaW/FCM-For-Mojo.git