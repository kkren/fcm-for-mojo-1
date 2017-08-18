FROM debian

MAINTAINER kotomei

EXPOSE 12450

RUN apt install -y nginx perl cpanminus
RUN cpanm Mojo:Webqq
